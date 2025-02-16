import 'package:finance_tracker_app/statemanagement/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        children: [
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: const Text("Language"),
            subtitle: const Text("English"),
            onTap: () {
              // Open language selection dialog (to be implemented)
            },
          ),
          ListTile(
            leading: const Icon(Icons.currency_exchange),
            title: const Text("Currency"),
            subtitle: const Text("USD"),
            onTap: () {
              // Open currency selection dialog (to be implemented)
            },
          ),
          ListTile(
            leading: const Icon(Icons.contrast_rounded),
            title: const Text("Theme"),
            subtitle: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Text(_themeName(state.themeMode));
              },
            ),
            onTap: () {
              _showThemeDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notification"),
          ),
          ListTile(
            leading: const Icon(Icons.upload_file_rounded),
            title: const Text("Export"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text("Send Feedback"),
            subtitle: const Text("xyz@abc.com"),
          ),
          ListTile(
            leading: const Icon(Icons.open_in_new_rounded),
            title: const Text("Privacy Policy"),
          ),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text("App Version"),
            subtitle: const Text("0.0.1"),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Theme"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption(context, "System", ThemeMode.system),
              _buildThemeOption(context, "Light", ThemeMode.light),
              _buildThemeOption(context, "Dark", ThemeMode.dark),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(BuildContext context, String title, ThemeMode mode) {
    return ListTile(
      title: Text(title),
      onTap: () {
        context.read<SettingCubit>().changeTheme(mode);
        Navigator.pop(context);
      },
    );
  }

  String _themeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
      default:
        return "System";
    }
  }
}
