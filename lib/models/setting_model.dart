import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// 0 -> system theme
// 1 -> light theme
// 2 -> dark theme

class SettingModel extends HiveObject {
  int themeMode;
  SettingModel({required this.themeMode});
}
