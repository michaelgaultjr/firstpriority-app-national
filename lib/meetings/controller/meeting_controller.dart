import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/cycle.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:first_priority_app/models/week.dart';
import 'package:get/get.dart';

class MeetingController extends GetxController {
  final api = Get.find<Api>();

  List<Meeting> _meetings = [];

  Future<void> create({
    String schoolId,
    String cycleId,
    String room,
    DateTime time,
    String week,
    Map<String, List<String>> roles,
  }) async {
    final res = await api.client.post(
      '/api/meeting',
      data: {
        'schoolId': schoolId,
        'cycleId': cycleId,
        'room': room,
        'time': time.toIso8601String(),
        'week': week,
        'roles': roles,
      },
    );

    _meetings.add(Meeting.fromMap(res.data));
  }

  Future<List<Meeting>> get() async {
    if (_meetings.isEmpty) {
      final res = await api.client.get('/api/meeting');

      _meetings = List.from(res.data).map((e) => Meeting.fromMap(e)).toList();
    }

    return _meetings;
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
