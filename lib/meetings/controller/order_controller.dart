import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/location.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final _api = Get.find<Api>();
  final _schoolController = Get.find<SchoolController>();

  Future<Location> getLocation({int total, String type}) async {
    final res = await _api.client.get(
      "/api/order/${_schoolController.school.value.id}/location",
      queryParameters: {
        "total": total,
        "type": type,
      },
    );

    return Location.fromMap(res.data);
  }

  Future<List<Location>> getLocations(String value, String type) async {
    final res = await _api.client.get(
      "/api/order/${_schoolController.school.value.id}/locations",
      queryParameters: {
        "query": value,
        "type": type,
      },
    );

    return List.from(res.data).map((e) => Location.fromMap(e)).toList();
  }
}
