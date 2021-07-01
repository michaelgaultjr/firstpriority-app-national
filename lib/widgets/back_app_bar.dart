import 'package:first_priority_app/widgets/text/header_text.dart';
import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(80);

  BackAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.95, 0),
                    child: IconButton(
                      constraints: BoxConstraints(maxHeight: 28, maxWidth: 28),
                      padding: new EdgeInsets.all(0.0),
                      icon: Icon(Icons.arrow_back),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Align(
                    child: HeaderText(
                      title,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
