import 'package:flutter/material.dart';

class SelectDialog extends StatelessWidget {
  final String title;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  SelectDialog({
    Key key,
    @required this.title,
    @required this.itemCount,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          child: Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      content: Container(
        width: 300,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
