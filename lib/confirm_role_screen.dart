import 'package:first_priority_app/async_search_delegate.dart';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:first_priority_app/validators.dart';
import 'package:first_priority_app/widgets/header_app_bar.dart';
import 'package:first_priority_app/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmRoleScreen extends StatefulWidget {
  @override
  State<ConfirmRoleScreen> createState() => _ConfirmRoleScreenState();
}

class _ConfirmRoleScreenState extends State<ConfirmRoleScreen> {
  static const FORMAT = "MMMM yyyy";
  static final commitmentForms = {
    ConfirmationRole.student: null,
    ConfirmationRole.studentLeader: dotenv.env['COMMITMENT_STUDENT_LEADER'],
    ConfirmationRole.teacherSponsor: dotenv.env['COMMITMENT_TEACHER_SPONSOR'],
    ConfirmationRole.mentor: dotenv.env['COMMITMENT_MENTOR']
  };

  final AccountController _accountController = Get.find<AccountController>();
  final SchoolController _schoolsController = Get.find<SchoolController>();

  final _graduationYearController = TextEditingController();
  final _schoolController = TextEditingController();

  ConfirmationRole _confirmationRole = ConfirmationRole.student;
  DateTime _graduationYear;
  School _school;
  bool _formOpened = false;
  bool _isStudentLeader = false;
  bool _agreed = false;

  @override
  void initState() {
    super.initState();
    final user = _accountController.user.value;
    if (user.hasRole("Leader"))
      _confirmationRole = ConfirmationRole.studentLeader;
    if (user.hasRole("Sponsor"))
      _confirmationRole = ConfirmationRole.teacherSponsor;
    if (user.hasRoles(["Mentor", "WaitingMentor"]))
      _confirmationRole = ConfirmationRole.mentor;

    if (user.graduationYear != null) setGraduationYear(user.graduationYear);

    _isStudentLeader = _confirmationRole == ConfirmationRole.studentLeader;
  }

  void setGraduationYear(DateTime graduationYear) {
    setState(() {
      _graduationYear = graduationYear;
      _graduationYearController.text = Jiffy(_graduationYear).format(FORMAT);
    });
  }

  void setSchool(School school) {
    setState(() {
      _school = school;
      _schoolController.text = _school.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formUrl = commitmentForms[_confirmationRole];
    return Scaffold(
      appBar: HeaderAppBar(
        title: "Expectations/Commitment",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            if (_schoolsController.school == null)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'School',
                  hintText: 'Pick your School',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator:
                    Validators.requiredWithMessage("Please pick a School"),
                controller: _schoolController,
                readOnly: true,
                onTap: () async {
                  showSearch(
                    context: context,
                    delegate: AsyncSearchDelegate<School>(
                      future: _schoolsController.searchSchools,
                      builder: (context, school) {
                        return ListTile(
                          title: Text(school.name),
                          onTap: () {
                            setSchool(school);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            if (_confirmationRole == ConfirmationRole.studentLeader ||
                _confirmationRole == ConfirmationRole.student)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Graduation Year',
                  hintText: 'Pick your Graduation Month & Year',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                controller: _graduationYearController,
                readOnly: true,
                onTap: () async {
                  var graduationYear = await showMonthPicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                  );

                  if (graduationYear == null) return;
                  setGraduationYear(graduationYear);
                },
              ),
            if (_confirmationRole == ConfirmationRole.studentLeader ||
                _confirmationRole == ConfirmationRole.student)
              CheckboxListTile(
                title: Text("I'm a Student Leader"),
                value: _isStudentLeader,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _isStudentLeader = value;
                    if (value) {
                      _confirmationRole = ConfirmationRole.studentLeader;
                    } else {
                      _confirmationRole = ConfirmationRole.student;
                    }
                  });
                },
              ),
            if (formUrl != null)
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Please review the Expectations/Commitment details and fill out the required forms if any in order to complete your yearly Expectations/Commitment agreement.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            SizedBox(height: 8),
            if (formUrl != null)
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Expectations/Commitment Details"),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Icon(Icons.open_in_browser),
                  ],
                ),
                onPressed: () async {
                  await canLaunch(formUrl)
                      ? await launch(formUrl)
                      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Unable to open commitment form"),
                        ));
                  setState(() {
                    _formOpened = true;
                  });
                },
              ),
            CheckboxListTile(
              title: Text("I agree to the Expectations/Commitment"),
              value: _agreed,
              onChanged: (bool newValue) {
                setState(() {
                  _agreed = newValue;
                });
              },
            ),
            if ((_formOpened && _agreed) ||
                _confirmationRole == ConfirmationRole.student)
              ElevatedButton(
                child: Text("Done"),
                onPressed: () {
                  if (!_formOpened &&
                      !_agreed &&
                      _confirmationRole != ConfirmationRole.student) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Notice"),
                            content: Text(
                                "You must open and review the Expectation/Commitment details and agree to them before continuing."),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Ok"))
                            ],
                          );
                        });
                  } else {
                    LoadingDialog.show(
                        context: context,
                        future: () async {
                          await _accountController.roleConfirmation(
                            role: _confirmationRole,
                            school: _school,
                            graduationYear: _graduationYear,
                          );
                        });
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
