import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String hintText;
  final String labelText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? fillColor;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.controller,
    this.keyboardType,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.name,
      obscureText: obscureText ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        enabledBorder: enabledBorder ??
            AppBorderDecoration.formFieldDecoration(Color(0xffCDCDCD)),
        focusedBorder: focusedBorder ??
            AppBorderDecoration.formFieldDecoration(Colors.blue),
        errorBorder: AppBorderDecoration.formFieldDecoration(Colors.red),
        focusedErrorBorder: AppBorderDecoration.formFieldDecoration(Colors.red),
        hintText: hintText,
        label: Text(labelText),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

abstract class AppBorderDecoration {
  static InputBorder formFieldDecoration(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color));
  }
}
