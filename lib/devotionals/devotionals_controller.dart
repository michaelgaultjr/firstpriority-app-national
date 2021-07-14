import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:get/get.dart';

class DevotionalsController extends GetxController {
  final api = Get.find<Api>();

  final RxList<Devotional> _devotionals = RxList<Devotional>();
  final Rx<Devotional> _today = Rx<Devotional>(null);

  Future<List<Devotional>> get() async {
    if (_devotionals.isEmpty) {
      final res = await api.client.get('/api/devotionals');

      _devotionals(
        List.from(res.data).map((e) => Devotional.fromMap(e)).toList(),
      );
    }

    return _devotionals;
  }

  Future<Devotional> getToday() async {
    if (_today.value == null) {
      final res = await api.client.get('/api/devotionals/today');

      _today(res.data == null || res.data == ""
          ? null
          : Devotional.fromMap(res.data));
    }

    return _today.value;
  }
}
