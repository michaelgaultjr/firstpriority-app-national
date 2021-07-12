import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/resource.dart';
import 'package:get/get.dart' as getx;

class ResourcesController extends getx.GetxController {
  Future<List<Resource>> get() async {
    final api = getx.Get.find<Api>();
    final res = await api.client.get('/api/links');

    return List.from(res.data).map((e) => Resource.fromMap(e)).toList();
  }
}
