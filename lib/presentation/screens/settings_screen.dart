import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        children: [
          ListTile(
            leading: Icon(Icons.language_rounded),
            title: Text("Language"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
            subtitle: Text("English"),
            subtitleTextStyle: TextTheme.of(context).bodyMedium,
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange),
            title: Text("Currency"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
            subtitle: Text("USD"),
            subtitleTextStyle: TextTheme.of(context).bodyMedium,
          ),
          ListTile(
            leading: Icon(Icons.contrast_rounded),
            title: Text("Theme"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
            subtitle: Text("System"),
            subtitleTextStyle: TextTheme.of(context).bodyMedium,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notification"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
          ),
          ListTile(
            leading: Icon(Icons.upload_file_rounded),
            title: Text("Export"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.send),
            title: Text("Send Feedback"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
            subtitle: Text("xyz@abc.com"),
            subtitleTextStyle: TextTheme.of(context).bodyMedium,
          ),
          ListTile(
            leading: Icon(Icons.open_in_new_rounded),
            title: Text("Privacy Policy"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text("App Version"),
            titleTextStyle: TextTheme.of(context).bodyLarge,
            subtitle: Text("0.0.1"),
            subtitleTextStyle: TextTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
