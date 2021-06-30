import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderText extends StatelessWidget {
  final String data;

  const HeaderText(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
