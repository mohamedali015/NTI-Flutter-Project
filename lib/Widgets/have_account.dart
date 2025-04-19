import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final String text;
  final String buttonText;

  const HaveAccount({super.key, required this.text, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
            onPressed: () {},
            child: Text(buttonText,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)))
      ],
    );
  }
}
