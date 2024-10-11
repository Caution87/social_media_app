import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
      ),
      body: Column(
        children: [
          MySettingsTile(title: "Something Settings", action: Icon(Icons.abc)),
        ],
      ),
    );
  }
}
