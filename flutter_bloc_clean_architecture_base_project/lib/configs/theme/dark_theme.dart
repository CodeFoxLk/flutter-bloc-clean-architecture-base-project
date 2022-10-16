import 'package:flutter/material.dart';

import 'common_theme_data.dart';
import 'theme.dart';

class DarkThme extends AppTheme with CommonThemeData {
  @override
  ThemeData getTheme() {
    final darkThemeData = ThemeData.dark();
    final updatedDarkThemeData = darkThemeData.copyWith(useMaterial3: true);

    return updatedDarkThemeData;
  }
}
