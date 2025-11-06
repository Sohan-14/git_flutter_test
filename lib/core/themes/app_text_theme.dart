import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_sizes.dart';

class AppTextTheme{
  AppTextTheme._();
  static const TextTheme lightTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.w600, color: AppColors.blackColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeH1, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeH2, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeH3, fontWeight: FontWeight.w500, color: AppColors.blackColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeBodyL, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeBodyM, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeBodyS, fontWeight: FontWeight.w400, color: AppColors.blackColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeBtn, fontWeight: FontWeight.w500, color: AppColors.blackColor),

  );

  static const TextTheme darkTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.w600, color: AppColors.blackColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeH1, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeH2, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeH3, fontWeight: FontWeight.w500, color: AppColors.blackColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeBodyL, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeBodyM, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeBodyS, fontWeight: FontWeight.w400, color: AppColors.blackColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeBtn, fontWeight: FontWeight.w500, color: AppColors.blackColor),
  );
}

