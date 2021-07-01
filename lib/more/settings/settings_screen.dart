import 'package:first_priority_app/notifiers/theme_notifier.dart';
import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: "Settings",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              _themeSettingTile(),
            ],
          ).toList(),
        ),
      ),
    );
  }

  static const _themes = {
    "light": "Light",
    "dark": "Dark",
  };

  Widget _themeSettingTile() {
    return Consumer<ThemeNotifier>(builder: (context, theme, _) {
      return ListTile(
          leading: Icon(Icons.palette),
          title: Text("Theme"),
          subtitle: Text(_themes[theme.key]),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Pick Theme"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                    content: Container(
                      width: 300,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _themes.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_themes[_themes.keys.toList()[index]]),
                            onTap: () {
                              theme.setTheme(_themes.keys.toList()[index]);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  );
                });
          });
    });
  }
}
