import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/cycle.dart';
import 'package:first_priority_app/models/meeting.dart';
import 'package:first_priority_app/models/week.dart';
import 'package:get/get.dart';

class MeetingController extends GetxController {
  final api = Get.find<Api>();
  final _schoolController = Get.find<SchoolController>();

  RxList<Meeting> get meetings => _meetings;
  RxList<Meeting> _meetings = RxList<Meeting>();

  Future<Meeting> create({
    String schoolId,
    String cycleId,
    String room,
    DateTime time,
    String week,
    Map<String, List<String>> roles,
  }) async {
    final res = await api.client.post(
      '/api/meetings/${_schoolController.school.value.id}',
      data: {
        'schoolId': schoolId,
        'cycleId': cycleId,
        'room': room,
        'time': time.toIso8601String(),
        'week': week,
        'roles': roles,
      },
    );

    final meeting = Meeting.fromMap(res.data);
    _meetings.add(meeting);
    _meetings.sort((a, b) => b.time.compareTo(a.time));

    return meeting;
  }

  Future<Meeting> edit({
    String meetingId,
    String cycleId,
    String room,
    DateTime time,
    String week,
    Map<String, List<String>> roles,
  }) async {
    final res = await api.client.patch(
      '/api/meetings/${_schoolController.school.value.id}',
      data: {
        'Id': meetingId,
        'cycleId': cycleId,
        'room': room,
        'time': time.toIso8601String(),
        'week': week,
        'roles': roles,
      },
    );

    final meeting = Meeting.fromMap(res.data);

    int index = _meetings.indexWhere((meeting) => meeting.id == meetingId);
    _meetings[index] = meeting;

    return meeting;
  }

  Future<List<Meeting>> get() async {
    if (_meetings.isEmpty) {
      final res = await api.client
          .get('/api/meetings/${_schoolController.school.value.id}');

      _meetings(List.from(res.data).map((e) => Meeting.fromMap(e)).toList());
    }

    return _meetings;
  }

  Future<void> cancel(Meeting meeting) async {
    final res = await api.client.delete(
      '/api/meetings/${_schoolController.school.value.id}/${meeting.id}',
    );

    if (res.statusCode == 200) {
      _meetings.remove(meeting);
    }
  }

  Future<bool> hasReport(DateTime time) async {
    final res = await api.client.get(
      '/api/meetings/${_schoolController.school.value.id}/report',
      queryParameters: {
        "time": time,
      },
    );

    return res.data as bool;
  }

  Future<List<Meeting>> getUpcoming() async {
    final meetings = await get();
    return meetings
        .where(
          (meeting) =>
              meeting.time.isAfter(DateTime.now()) &&
              meeting.time.isBefore(
                DateTime.now().add(Duration(days: 7)),
              ),
        )
        .toList();
  }

  Future<List<Week>> getWeeks() async {
    final res = await api.client.get('/api/weeks');

    return List.from(res.data).map((e) => Week.fromMap(e)).toList();
  }

  Future<List<Cycle>> getCycles() async {
    final res = await api.client.get('/api/cycles');

    return List.from(res.data).map((e) => Cycle.fromMap(e)).toList();
  } 
}
