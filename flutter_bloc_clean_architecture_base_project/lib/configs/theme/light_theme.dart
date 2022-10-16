import 'package:flutter/material.dart';
import 'common_theme_data.dart';
import 'theme.dart';

class LightTheme extends AppTheme with CommonThemeData {
  @override
  ThemeData getTheme() {
    final lightThemeData =  ThemeData.light();
    final updatedLightThemeData = lightThemeData.copyWith(
      useMaterial3: true
    );

    return updatedLightThemeData;
  }
}
