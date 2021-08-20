import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/validators.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderContact extends StatefulWidget {
  const OrderContact({Key key}) : super(key: key);

  @override
  OrderContactState createState() => OrderContactState();
}

class OrderContactState extends State<OrderContact> {
  final AccountController _accountController = Get.find<AccountController>();

  TextEditingController _nameTextController;
  TextEditingController _emailTextController;
  TextEditingController _phoneNumberTextController;
  TextEditingController _notesTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final user = _accountController.user.value;

    _nameTextController = TextEditingController(text: user.name);
    _emailTextController = TextEditingController(text: user.email);
    _phoneNumberTextController = TextEditingController(text: user.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          "Pickup / Delivery Contact",
          fontSize: 28,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
          ),
          controller: _nameTextController,
          validator: Validators.required,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Email",
          ),
          controller: _emailTextController,
          validator: Validators.email,
          keyboardType: TextInputType.emailAddress,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Phone Number",
          ),
          controller: _phoneNumberTextController,
          validator: Validators.phoneNumber,
          keyboardType: TextInputType.phone,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Notes",
            hintText: "Enter notes here...",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          controller: _notesTextController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ],
    );
  }

  Map<String, dynamic> getData() {
    return {
      "name": _nameTextController.text,
      "email": _emailTextController.text,
      "phoneNumber": _phoneNumberTextController.text,
      "notes": _notesTextController.text,
    };
  }
}
