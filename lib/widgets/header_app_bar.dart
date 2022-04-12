import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  @override
  Size get preferredSize => const Size.fromHeight(80);

  HeaderAppBar({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TitleText(title),
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
