import 'package:get/get.dart';

class SignUpController extends GetxController {
  var schoolSelectedValue = 'Select School'.obs;

  final isChecked = false.obs;
  bool valuesecond = false;

  List<String> schoolList = [
    'Select School',
    'Miami Central High School',
    'Ellon High School',
    'Alvin High School',
    'Estran Central High School',
  ].obs;
}
