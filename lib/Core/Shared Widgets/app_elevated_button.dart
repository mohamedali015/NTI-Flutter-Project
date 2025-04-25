import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';

class AppElevatedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final String? routeName;

  const AppElevatedButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.routeName,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? AppColors.primary),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            vertical: verticalPadding ?? size.height * 0.02,
            horizontal: horizontalPadding ?? size.width * 0.05,
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(buttonWidth ?? double.infinity,
              buttonHeight ?? size.height * 0.07),
        ),
        elevation: WidgetStateProperty.all(size.height * 0.008),
        shadowColor: WidgetStateProperty.all(AppColors.primary),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
