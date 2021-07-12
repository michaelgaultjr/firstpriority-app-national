import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/widgets/header_app_bar.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolsScreen extends StatefulWidget {
  const SchoolsScreen({Key key}) : super(key: key);

  @override
  _SchoolsScreenState createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  final SchoolController _schoolController = Get.find<SchoolController>();

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
                child: SingleChildScrollView(
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
                        )
                      ],
                    ),
                  ),
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
                onTap: () {
                  _schoolController.school(snapshot.data[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
