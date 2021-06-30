import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubtitleText extends StatelessWidget {
  final String data;

  const SubtitleText(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.subtitle2);
  }
}
