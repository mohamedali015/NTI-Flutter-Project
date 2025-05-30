import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';
import 'package:flutter_nti_task/Core/utils/app_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    fontFamily: AppConstants.fontFamily,
    useMaterial3: true,

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackground,
    ),
  );
}
