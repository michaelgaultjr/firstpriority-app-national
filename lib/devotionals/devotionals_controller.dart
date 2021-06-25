import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:get/get.dart';

class DevotionalsController extends GetxController {
  final api = Get.find<Api>();

  Future<List<Devotional>> get() async {
    final res = await api.client.get('/api/devotionals');

    return List.from(res.data).map((e) => Devotional.fromMap(e)).toList();
  }

  Future<Devotional> getToday() async {
    final res = await api.client.get('/api/devotionals/today');

    if (res.data == null || res.data == "") {
      return Devotional(title: "No Devotional Today");
    }

    return Devotional.fromMap(res.data);
  }
}
