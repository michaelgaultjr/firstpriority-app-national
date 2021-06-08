import 'package:first_priority_app/controllers/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MeetingCreate extends StatefulWidget {
  const MeetingCreate({Key key}) : super(key: key);

  @override
  _MeetingCreateState createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final _accountController = Get.find<AccountController>();
  final _formKey = GlobalKey<FormState>();

  String dropdownValue = 'One';

  final List<String> roles = [
    'Greeters',
    'Prayer',
    'Game Coordinators',
    'Promotions',
    'Audio Visual',
    'Food Order',
    'Discussion Leaders',
    'Setup & Teardown',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'New Event',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    child: Text(
                      _accountController.user.value.schoolName,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Room',
                      ),
                    ),
                    InputDatePickerFormField(
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        Duration(days: 10),
                      ),
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: 'Week'),
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'One',
                        'Two',
                        'Three',
                        'Four',
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                    Column(
                      children: List.generate(roles.length, (index) {
                        return _roleInputDisplay(roles[index]);
                      }),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Schedule Event'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _roleInputDisplay(String roleName) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: roleName,
      ),
    );
  }
}
