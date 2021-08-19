import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/notifiers/theme_notifier.dart';
import 'package:first_priority_app/widgets/header_app_bar.dart';
import 'package:first_priority_app/widgets/loading_dialog.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SchoolsScreen extends StatefulWidget {
  const SchoolsScreen({Key key}) : super(key: key);

  @override
  _SchoolsScreenState createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  final SchoolController _schoolController = Get.find<SchoolController>();
  final AccountController _accountController = Get.find<AccountController>();

  Future<List<School>> _schools;

  @override
  void initState() {
    super.initState();
    _schools = _schoolController.getSchools();
  }

  Future<void> _pullRefresh() async {
    final schools = await _schoolController.getSchools();
    setState(() {
      _schools = Future.value(schools);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: "Select School",
      ),
      body: FutureBuilder<List<School>>(
        future: _schools,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data.isEmpty) {
            return RefreshIndicator(
              onRefresh: _pullRefresh,
              child: Container(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Center(
                        child: Column(
                          children: [
                            TitleText("No Schools"),
                            SubtitleText(
                              "Please contact our staff to resolve this issue.",
                            ),
                            SubtitleText(
                              "Mentors, make sure to complete the commitment form.",
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: ElevatedButton(
                        child: Text("Logout"),
                        onPressed: () async {
                          LoadingDialog.show(
                            context: context,
                            future: () async {
                              await _accountController.logout();
                              Provider.of<ThemeNotifier>(context, listen: false)
                                  .setTheme(null);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].name),
                onTap: () async {
                  await _schoolController.setSchool(snapshot.data[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
