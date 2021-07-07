import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleText extends StatelessWidget {
  final String data;
  final double fontSize;

  const TitleText(this.data, {Key key, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline1.copyWith(fontSize: fontSize),
    );
  }
}
