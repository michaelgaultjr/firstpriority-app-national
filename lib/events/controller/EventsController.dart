import 'package:first_priority_app/events/model/DiscussionModel.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../model/EventsDetailsModel.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  var eventDetailsTitle = 'WEDNESDAY, SEPTEMBER 27'.obs;
  var eventDetailsSubTitle = 'Equip'.obs;
  var eventRoomTimeText = '3:30p • Room 204'.obs;
  var selectedEventDate = 'Saturday, June 6, 2021'.obs;
  var selectedEventTime = '10:20'.obs;
  var isChecked = false.obs;
  var eventDetailsDescription =
      'Orci viverra ad cras dapibus sagittis vitae nisi nulla tempus, ligula nascetur cubilia adipiscing in justo varius dignissim ipsum venenatis, erat sed metus quisque cursus felis risus natoque.'
          .obs;

  var cycleSelected;
  var cycleSelectedValue = 'Cycle 1: September'.obs;

  var weekSelected;
  var weekSelectedValue = 'Epic1'.obs;
  var discusionText = 'John Doe, Janet Smith'.obs;
  var prayerText = 'John Doe'.obs;
  var gameText = 'Janet Smith'.obs;
  var greeterText = 'Jim Wells, Haley Brown'.obs;
  var promotionsText = 'Haley Brown'.obs;
  var setupText = 'Haley Brown'.obs;
  var audioText = 'Brown'.obs;
  var foodText = 'John Doe, Janet Smith'.obs;

  List<String> discussionLeaderList = [
    'John Doe',
    'Janet Smith',
    'Jim Well',
    'Haley Brown',
    'Jim Wells',
    'Haley Brown',
  ].obs;

  var discussionItems = discussionList
      .map((value) => MultiSelectItem<DiscussionModel>(value, value.name))
      .toList()
      .obs;

  static List<DiscussionModel> discussionList = [
    DiscussionModel(id: 1, name: "John Doe"),
    DiscussionModel(id: 2, name: "Janet Smith"),
    DiscussionModel(id: 3, name: "Jim Well"),
    DiscussionModel(id: 4, name: "Haley Brown"),
    DiscussionModel(id: 5, name: "Jim Wells"),
    DiscussionModel(id: 6, name: "Jim Wells"),
    DiscussionModel(id: 7, name: "John Doe"),
    DiscussionModel(id: 8, name: "Janet Smith"),
    DiscussionModel(id: 9, name: "Jim Well"),
    DiscussionModel(id: 10, name: "Haley Brown"),
    DiscussionModel(id: 11, name: "Jim Wells"),
    DiscussionModel(id: 12, name: "Jim Wells"),
  ].obs;

  List<String> cycleList = [
    'Cycle 1: September',
    'Cycle 1: Nov.',
    'Cycle 1: Dec.',
    'Cycle 1: Jan',
  ].obs;
  List<String> weekList = [
    'Epic1',
    'Epic2',
    'Epic3',
    'Epic4',
  ].obs;

  var detailsRoleList = [
    EvetnsDetailsModel('Discussion Leaders:', 'John Doe, Janet Smith'),
    EvetnsDetailsModel('Prayer:', 'Jim Wells, Haley Brown'),
    EvetnsDetailsModel('Game Coordinators:', 'Jim Wells, Haley Brown'),
    EvetnsDetailsModel('Greeters:', 'Jim Wells, Haley Brown'),
    EvetnsDetailsModel('Promotions:', 'Jim Wells'),
    EvetnsDetailsModel(
        'Setup & Teardown:', 'Jim Wells, Haley Brown, Ella Johnson'),
    EvetnsDetailsModel('Food Orders', 'Jim Wells, Haley Brown, Ella Johnson'),
  ];

  final titles = [
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip"
  ].obs;
  final subtitles = [
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567"
  ].obs;

  void setDateFormat(DateTime date, int i) {
    if (i == 1) {
      final DateFormat formatter1 = DateFormat('EEEE, MMMM M, yyyy');
      final String formatted1 = formatter1.format(date);
      selectedEventDate.value = formatted1.toString();
    } else {
      final String time = '${date.hour}:${date.minute}';
      selectedEventTime.value = time.toString();
    }
  }
}
