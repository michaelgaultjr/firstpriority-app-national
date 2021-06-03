import 'package:first_priority_app/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  PillButton({@required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      margin: EdgeInsets.only(bottom: 4.0, right: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: colorLightGray,
        child: InkWell(
          child: Center(
            child: child,
          ),
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
