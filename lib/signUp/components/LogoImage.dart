import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 80,width: 80,
            ),
          ),
        );
  }
}
