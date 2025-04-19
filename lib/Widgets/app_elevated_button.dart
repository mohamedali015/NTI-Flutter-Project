import 'package:flutter/material.dart';

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

  const AppElevatedButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? Colors.green),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            vertical: verticalPadding ?? 15,
            horizontal: horizontalPadding ?? 20,
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(buttonWidth ?? double.infinity, buttonHeight ?? 50),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
