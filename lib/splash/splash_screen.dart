import 'package:first_priority_app/widgets/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    _controller.initialize().then((value) {
      Get.off(() => Authenticate());
    }).catchError((error) => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                  'Unable to connect to server. Please try again later.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            },
          )
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
