import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/widgets/header_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolsScreen extends StatefulWidget {
  const SchoolsScreen({Key key}) : super(key: key);

  @override
  _SchoolsScreenState createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  final SchoolController _schoolController = Get.find<SchoolController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: "Select School",
      ),
      body: FutureBuilder<List<School>>(
        future: _schoolController.getSchools(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
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
