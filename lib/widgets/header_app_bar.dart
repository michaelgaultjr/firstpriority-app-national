import 'package:first_priority_app/widgets/text/header_text.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  @override
  Size get preferredSize => const Size.fromHeight(90);

  HeaderAppBar({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: HeaderText(title),
            ),
            if (subtitle != null)
              Container(
                child: SubtitleText(subtitle),
              ),
          ],
        ),
      ),
    );
  }
}
