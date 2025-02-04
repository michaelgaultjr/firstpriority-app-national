import 'dart:async';

import 'package:first_priority_app/async_search_delegate.dart';
import 'package:first_priority_app/meetings/controller/order_controller.dart';
import 'package:first_priority_app/models/location.dart';
import 'package:first_priority_app/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonutsOrderWidget extends StatefulWidget {
  final RxInt expectedStudents;
  final void Function(Map<String, dynamic>) onData;

  const DonutsOrderWidget({
    Key key,
    this.expectedStudents,
    this.onData,
  }) : super(key: key);

  @override
  _DonutsOrderWidgetState createState() => _DonutsOrderWidgetState();
}

class _DonutsOrderWidgetState extends State<DonutsOrderWidget> {
  final OrderController _orderController = Get.find<OrderController>();
  static const String component = "Donuts";

  final TextEditingController _storeController = TextEditingController();

  Location location;
  StreamSubscription<int> studentsListener;

  static List<int> _prices = [
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    65,
    70,
    75,
  ];

  int _amount = 10;
  int _calculatedAmount;

  @override
  void initState() {
    calculateCardValue(widget.expectedStudents.value);
    studentsListener = widget.expectedStudents.listen((students) {
      setState(() {
        calculateCardValue(students);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    studentsListener.cancel();
    super.dispose();
  }

  void calculateCardValue(int students) {
    double multiplier = .95;
    if (students > 85)
      multiplier = .7;
    else if (students > 50)
      multiplier = .8;
    else if (students > 20) multiplier = .9;

    int newValue = ((students * multiplier) / 5).ceil() * 5;
    print(newValue);
    if (newValue < 10) newValue = 10;
    if (newValue > 75) newValue = 75;

    _calculatedAmount = newValue;
    _amount = newValue;
  }

  @override
  Widget build(BuildContext context) {
    widget.onData(getOrderDetails());
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Location",
            hintText: "Select a Store",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          readOnly: true,
          controller: _storeController,
          validator: Validators.required,
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
        ),
        DropdownButtonFormField<int>(
          decoration: InputDecoration(labelText: "Amount"),
          validator: Validators.requiredInt,
          value: _amount,
          onChanged: (int newPrice) {
            setState(() {
              _amount = newPrice;
            });
          },
          items: _prices.map<DropdownMenuItem<int>>(
            (int price) {
              return DropdownMenuItem<int>(
                value: price,
                child: Text("\$$price"),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  void setLocation(Location location) {
    setState(() {
      this.location = location;
      _storeController.text = location.name;
    });
  }

  Map<String, dynamic> getOrderDetails() {
    return {
      "amount": _amount,
      "calculatedAmount": _calculatedAmount,
      "locationId": location?.id,
    };
  }
}
