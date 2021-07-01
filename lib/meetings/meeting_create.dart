import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/models/cycle.dart';
import 'package:first_priority_app/models/user_profile.dart';
import 'package:first_priority_app/models/week.dart';
import 'package:first_priority_app/validators.dart';
import 'package:first_priority_app/widgets/generic_list.dart';
import 'package:first_priority_app/widgets/header_app_bar.dart';
import 'package:first_priority_app/widgets/loading_dialog.dart';
import 'package:first_priority_app/widgets/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MeetingCreate extends StatefulWidget {
  const MeetingCreate({Key key}) : super(key: key);

  @override
  _MeetingCreateState createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final _formKey = GlobalKey<FormState>();

  final _controller = Get.find<MeetingController>();
  final _schoolController = Get.find<SchoolController>();
  final _accountController = Get.find<AccountController>();
  final _timeController = TextEditingController();

  final _roomController = TextEditingController();

  Week _week;
  Cycle _cycle;
  DateTime _meetingTime;

  final Map<String, ValueNotifier<List<UserProfile>>> roles = {
    'Greeters': ValueNotifier([]),
    'Prayer': ValueNotifier([]),
    'Game Coordinators': ValueNotifier([]),
    'Promotions': ValueNotifier([]),
    'Audio Visual': ValueNotifier([]),
    'Food Order': ValueNotifier([]),
    'Discussion Leaders': ValueNotifier([]),
    'Setup & Teardown': ValueNotifier([]),
  };

  @override
  void initState() {
    super.initState();
    _roomController.text = _accountController.user.value.schoolRoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: "New Meeting",
        subtitle: _accountController.user.value.schoolName,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([
            _controller.getWeeks(),
            _controller.getCycles(),
          ]),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final weeks = snapshot.data[0] as List<Week>;
            final cycles = snapshot.data[1] as List<Cycle>;

            if (_week == null) _week = weeks.first;
            if (_cycle == null) _cycle = cycles.first;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _roomController,
                      decoration: InputDecoration(
                        labelText: 'Room',
                      ),
                      validator: Validators.required,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Meeting Date',
                      ),
                      validator: Validators.required,
                      controller: _timeController,
                      readOnly: true,
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            Duration(days: 365),
                          ),
                        );

                        if (date == null) return;

                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (time == null) return;

                        _meetingTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );

                        _timeController.text = DateFormat(
                          'MMMM d @ h:mma',
                        ).format(_meetingTime);
                      },
                    ),
                    DropdownButtonFormField<Week>(
                      decoration: InputDecoration(labelText: 'Week'),
                      value: _week,
                      onChanged: (Week newWeek) {
                        setState(() {
                          _week = newWeek;
                        });
                      },
                      items: weeks.map<DropdownMenuItem<Week>>(
                        (Week week) {
                          return DropdownMenuItem<Week>(
                            value: week,
                            child: Text(week.name),
                          );
                        },
                      ).toList(),
                    ),
                    DropdownButtonFormField<Cycle>(
                      decoration: InputDecoration(labelText: 'Cycle'),
                      value: _cycle,
                      onChanged: (Cycle newCycle) {
                        setState(() {
                          _cycle = newCycle;
                        });
                      },
                      items: cycles.map<DropdownMenuItem<Cycle>>(
                        (Cycle cycle) {
                          return DropdownMenuItem<Cycle>(
                            value: cycle,
                            child: Text(cycle.name),
                          );
                        },
                      ).toList(),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20, bottom: 5),
                      child: HeaderText('Roles'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        roles.length,
                        (index) {
                          final key = roles.keys.elementAt(index);
                          return GenericList<UserProfile>(
                            controller: roles[key],
                            title: Text(
                              key,
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            onSearch: _schoolController.searchUsers,
                            resultBuilder: (context, user, cb) {
                              return ListTile(
                                title: Text(user.name),
                                subtitle: Text(user.role),
                                onTap: cb,
                              );
                            },
                            itemBuilder: (context, user) {
                              return Card(
                                child: ListTile(
                                  visualDensity: VisualDensity.compact,
                                  trailing: Icon(Icons.arrow_back),
                                  title: Text(
                                    user.name,
                                  ),
                                  subtitle: Text(user.role),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          LoadingDialog.show(
                            context: context,
                            future: () async {
                              await _controller.create(
                                schoolId:
                                    _accountController.user.value.schoolId,
                                room: _roomController.text,
                                time: _meetingTime,
                                week: _week.name,
                                cycleId: _cycle.id,
                                roles: roles.map(
                                  (key, value) => MapEntry(
                                    key,
                                    value.value.map((e) => e.id).toList(),
                                  ),
                                ),
                              );

                              Get.back();
                            },
                          );
                        }
                      },
                      child: Text('Schedule Meeting'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
