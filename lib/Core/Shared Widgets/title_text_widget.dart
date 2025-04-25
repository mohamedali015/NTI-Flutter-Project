import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const TitleTextWidget({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyle ??
            TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: AppColors.primary));
  }
}
