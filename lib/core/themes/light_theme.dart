import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'app_text_theme.dart';

class LightTheme{
  LightTheme._();
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor).copyWith( brightness: Brightness.light),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    dividerColor: AppColors.dividerColor,
    textTheme: AppTextTheme.lightTextTheme,
  );
}
