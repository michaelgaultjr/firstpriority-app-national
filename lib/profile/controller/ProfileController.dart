import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var emailController = TextEditingController(text : "mark.teney@gmail.com").obs;
  var countryController = TextEditingController(text : "Lake County").obs;
  var schoolController = TextEditingController(text :"Lake High School").obs;
  var classController = TextEditingController(text : "Class of 2025").obs;
  var cityController = TextEditingController(text : "City Church").obs;
}