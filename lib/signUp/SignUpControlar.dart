import 'package:get/get.dart';

class SignUpController extends GetxController {
  var eventSelectedValue = ''.obs;
  var fieldMgrDamagedSelectedValue = 'Select School';

  List<String> fieldMgrDamageDropDownItems = [
    'Select School',
    'Miami Central High School',
    'Ellon High School',
    'Alvin High School',
    'Estran Central High School',
  ];

  List<String> eventDropDownItems = List<String>().obs;
  List<String> schoolsList = [
    'one',
    'two',
    'three',
  ].obs;

  void setEventsList() {
    eventDropDownItems.clear();
    eventSelectedValue.value = 'one';

    eventDropDownItems.add('one');
    eventDropDownItems.add('two');
    eventDropDownItems.add('three');

    eventDropDownItems.insert(0, 'Select');
  }
}
