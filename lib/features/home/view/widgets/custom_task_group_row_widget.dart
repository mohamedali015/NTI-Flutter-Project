import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/home/view/widgets/container_icon_widget.dart';

import '../../../../core/utils/app_color.dart';

class CustomTaskGroupRowWidget extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
  final String title;
  final int tasksNumber;
  final VoidCallback onPressed;

  const CustomTaskGroupRowWidget({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconColor,
    required this.title,
    required this.tasksNumber,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.018,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            ContainerIconWidget(
              imagePath: imagePath,
              backgroundColor: backgroundColor,
              iconColor: iconColor,
              width: size.width * 0.1,
              height: size.height * 0.045,
              iconWidth: size.width * 0.03,
              iconHeight: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.007,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(size.width * 0.03),
              ),
              child: Text(
                "$tasksNumber",
                style: TextStyle(
                  color: iconColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
