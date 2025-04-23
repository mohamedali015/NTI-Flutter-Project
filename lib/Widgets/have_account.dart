import 'package:flutter/material.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class HaveAccount extends StatelessWidget {
  final String? text;
  final String buttonText;
  final String routeName;

  const HaveAccount(
      {super.key,
      this.text,
      required this.buttonText,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text ?? ""),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, routeName, (route) => false);
            },
            child: Text(
              buttonText,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
