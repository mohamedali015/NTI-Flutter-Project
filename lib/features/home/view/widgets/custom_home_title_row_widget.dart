import 'package:flutter/material.dart';

import '../../../../core/translations/app_strings.dart';
import '../../../../core/utils/app_color.dart';

class CustomHomeTitleRowWidget extends StatelessWidget {
  final int? tasksNumber;
  final String title;

  const CustomHomeTitleRowWidget(
      {super.key, this.tasksNumber, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.lightBlack,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        if (tasksNumber != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.005,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(38),
              borderRadius: BorderRadius.circular(size.width * 0.03),
            ),
            child: Text(
              "$tasksNumber",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
