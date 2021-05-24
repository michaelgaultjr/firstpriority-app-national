import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'SplashController.dart';

class SplashScreen extends StatelessWidget {
 final SplashController _splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: SvgPicture.asset('assets/images/logo.svg'),
              // Image(
              //   image: AssetImage('assets/images/splashimage.png'),
              //   fit: BoxFit.cover,
              //   height:Get.height,
              //   width:Get.width,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
