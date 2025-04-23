import 'package:flutter/material.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      // height: size.height * 0.12,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),

      decoration: BoxDecoration(
        color: AppColors.sky,
        borderRadius: BorderRadius.circular(size.width * 0.03),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 3,
            color: AppColors.lightGrey,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My First Task",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "11/03/2025",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "05:00 PM",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.001,
          ),
          SizedBox(
            width: size.width * 0.45,
            child: Text(
              "Improve my English skills by trying to speak",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
