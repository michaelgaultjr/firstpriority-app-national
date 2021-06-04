import 'package:first_priority_app/events/EventsDetailsModel.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  final List<Event> events = [
    Event(
        weekType: 'Equip',
        schoolName: 'Vero Central High School',
        room: 'Room 567'),
    Event(
        weekType: 'Equip',
        schoolName: 'Vero Central High School',
        room: 'Room 567'),
    Event(
        weekType: 'Equip',
        schoolName: 'Vero Central High School',
        room: 'Room 567'),
    Event(
        weekType: 'Equip',
        schoolName: 'Vero Central High School',
        room: 'Room 567'),
    Event(
        weekType: 'Equip',
        schoolName: 'Vero Central High School',
        room: 'Room 567'),
  ];

  var eventDetailsTitle = 'WEDNESDAY, SEPTEMBER 27'.obs;
  var eventDetailsSubTitle = 'Equip'.obs;
  var eventRoomTimeText = '3:30p • Room 204'.obs;
  var eventDetailsDescription =
      'Orci viverra ad cras dapibus sagittis vitae nisi nulla tempus, ligula nascetur cubilia adipiscing in justo varius dignissim ipsum venenatis, erat sed metus quisque cursus felis risus natoque.'
          .obs;

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
}
