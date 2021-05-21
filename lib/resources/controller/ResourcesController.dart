import 'package:get/get.dart';

class ResourcesController extends GetxController {
  var selectedImage = ''.obs;
  var titleText = ''.obs;
  List imagesList = [
    "assets/images/resources1.jpg",
    "assets/images/resources2.jpg",
    "assets/images/resources3.jpg",
  ].obs;
 List titleList = [
    "The Four",
    "Club Start-Up",
    "Ministry Grid",
  ].obs;
}
