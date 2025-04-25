import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';

abstract class AppTextStyles {
  static const String fontFamily = "Lexend_Deca";
  static TextStyle x = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w300, color: AppColors.lightBlack);
  static TextStyle taskTitleData = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey);
}
