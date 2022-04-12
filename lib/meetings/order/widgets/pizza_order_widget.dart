import 'dart:async';

import 'package:first_priority_app/async_search_delegate.dart';
import 'package:first_priority_app/meetings/controller/order_controller.dart';
import 'package:first_priority_app/models/location.dart';
import 'package:first_priority_app/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PizzaOrderWidget extends StatefulWidget {
  final DateTime meetingTime;
  final RxInt expectedStudents;
  final void Function(Map<String, dynamic>) onData;

  PizzaOrderWidget({
    Key key,
    this.meetingTime,
    this.expectedStudents,
    this.onData,
  }) : super(key: key);

  @override
  _PizzaOrderWidgetState createState() => _PizzaOrderWidgetState();
}

class _PizzaOrderWidgetState extends State<PizzaOrderWidget> {
  final OrderController _orderController = Get.find<OrderController>();

  final TextEditingController _cheeseController =
      TextEditingController(text: "0");

  final TextEditingController _pepperoniController =
      TextEditingController(text: "0");

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  static const String component = "Pizza";

  DateTime pickupTime;
  int totalPizzas;
  Location location;
  StreamSubscription<int> studentsListener;

  @override
  void initState() {
    pickupTime = widget.meetingTime.add(
      Duration(hours: -1),
    );

    _timeController.text = Jiffy(pickupTime).format("h:mm a");

    calculatePizzas(widget.expectedStudents.value);
    studentsListener = widget.expectedStudents.listen((newValue) {
      setState(() {
        calculatePizzas(newValue);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    studentsListener.cancel();
    super.dispose();
  }

  void calculatePizzas(int students) {
    int divider = 5;
    if (students > 85)
      divider = 8;
    else if (students > 50)
      divider = 7;
    else if (students > 20) divider = 6;

    totalPizzas = (students / divider).ceil();

    _cheeseController.text = (totalPizzas / 2).floor().toString();
    _pepperoniController.text =
        (totalPizzas / 2 + totalPizzas % 2).floor().toString();

    _orderController
        .getLocation(total: totalPizzas, type: component)
        .then((location) => setLocation(location));
  }

  @override
  Widget build(BuildContext context) {
    widget.onData(getOrderDetails());
    return Column(
      children: [
        _buildNumberTextField(
          "Cheese",
          _cheeseController,
        ),
        _buildNumberTextField(
          "Pepperoni",
          _pepperoniController,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Pickup Time",
            hintText: "Select a Pickup time",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: Validators.requiredWithMessage(
            "Please select a pickup time",
          ),
          controller: _timeController,
          readOnly: true,
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(pickupTime),
            );

            if (time == null) return;

            setState(() {
              pickupTime = DateTime(
                pickupTime.year,
                pickupTime.month,
                pickupTime.day,
                time.hour,
                time.minute,
              );

              _timeController.text = Jiffy(pickupTime).format("h:mm a");
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Location",
          ),
          readOnly: true,
          controller: _locationController,
          onTap: () {
            showSearch(
              context: context,
              delegate: AsyncSearchDelegate<Location>(
                future: (value) async {
                  return _orderController.getLocations(value, component);
                },
                builder: (context, item) {
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.vendor),
                    onTap: () {
                      setLocation(item);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  void setLocation(Location location) {
    setState(() {
      this.location = location;
      _locationController.text = location.name;
    });
  }

  Widget _buildNumberTextField(String title, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      validator: Validators.required,
      keyboardType: TextInputType.number,
    );
  }

  Map<String, dynamic> getOrderDetails() {
    return {
      "cheese": int.parse(_cheeseController.text),
      "pepperoni": int.parse(_pepperoniController.text),
      "time": pickupTime.toIso8601String(),
      "locationId": location?.id,
    };
  }
}
