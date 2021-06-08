import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:get/get.dart';

class MeetingController extends GetxController {
  final api = Get.find<Api>();
  Future<List<Meeting>> get() async {
    final res = await api.client.get('/api/meeting');

    return List.from(res.data).map((e) => Meeting.fromMap(e)).toList();
  }
}
