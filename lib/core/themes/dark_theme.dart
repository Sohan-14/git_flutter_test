import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'app_text_theme.dart';

/// [DarkTheme] change the color from light to dark if needed
class DarkTheme{
  DarkTheme._();
  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor).copyWith( brightness: Brightness.dark),
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
