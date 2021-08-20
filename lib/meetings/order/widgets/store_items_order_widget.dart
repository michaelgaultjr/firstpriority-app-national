import 'dart:async';

import 'package:first_priority_app/async_search_delegate.dart';
import 'package:first_priority_app/meetings/controller/order_controller.dart';
import 'package:first_priority_app/models/location.dart';
import 'package:first_priority_app/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreItemsOrderWidget extends StatefulWidget {
  final RxInt expectedStudents;
  final void Function(Map<String, dynamic>) onData;

  const StoreItemsOrderWidget({
    Key key,
    this.expectedStudents,
    this.onData,
  }) : super(key: key);

  @override
  _StoreItemsOrderWidgetState createState() => _StoreItemsOrderWidgetState();
}

class _StoreItemsOrderWidgetState extends State<StoreItemsOrderWidget> {
  final OrderController _orderController = Get.find<OrderController>();
  static const String component = "StoreItems";

  final TextEditingController _storeController = TextEditingController();

  Location location;
  StreamSubscription<int> studentsListener;

  static List<int> _amounts = [
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

  static List<String> _items = [
    "Ice Cream",
    "Cookies",
    "Cereal",
    "Other",
  ];

  int _amount = 10;
  int _calculatedAmount;
  String _item;

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
    int newValue = ((students * .70) / 5).ceil() * 5;
    if (newValue < 10) newValue = 10;
    if (newValue > 75) newValue = 75;
    print(newValue);
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
          validator: Validators.required,
          readOnly: true,
          controller: _storeController,
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
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Item",
            hintText: "Select an Item",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: Validators.required,
          value: _item,
          onChanged: (String newItem) {
            setState(() {
              _item = newItem;
            });
          },
          items: _items.map<DropdownMenuItem<String>>(
            (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            },
          ).toList(),
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
          items: _amounts.map<DropdownMenuItem<int>>(
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
      "item": _item,
    };
  }
}
