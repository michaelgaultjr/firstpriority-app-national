import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String data;
  final double fontSize;

  const SubtitleText(this.data, {Key key, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: fontSize),
    );
  }
}
