import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/validators.dart';
import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:first_priority_app/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final _accountController = Get.find<AccountController>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = _accountController.user.value.firstName;
    _lastNameController.text = _accountController.user.value.lastName;
    _phoneNumberController.text = _accountController.user.value.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: "Account",
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "First Name",
                ),
              ),
              TextFormField(
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Last Name",
                ),
              ),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: Validators.phoneNumber,
                // inputFormatters: [
                //   MaskTextInputFormatter(
                //     mask: '(###) ###-####',
                //     filter: {
                //       "#": RegExp(r'\d'),
                //     },
                //   )
                // ],
                decoration: InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    LoadingDialog.show(
                      context: context,
                      future: () async {
                        await _accountController.updateDetails(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          phoneNumber: _phoneNumberController.text,
                        );
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
