import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:flutter/material.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final Box settingsBox;

  SettingCubit(this.settingsBox)
    : super(SettingState(themeMode: _loadThemeMode(settingsBox)));

  static ThemeMode _loadThemeMode(Box settingsBox) {
    int savedTheme = settingsBox.get('themeMode', defaultValue: 0);
    return _mapThemeMode(savedTheme);
  }

  static ThemeMode _mapThemeMode(int value) {
    switch (value) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static int _mapThemeValue(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
      default:
        return 0;
    }
  }

  void changeTheme(ThemeMode mode) {
    settingsBox.put('themeMode', _mapThemeValue(mode));
    emit(SettingState(themeMode: mode));
  }
}
