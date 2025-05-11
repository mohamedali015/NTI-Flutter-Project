import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/utils/app_assets.dart';
import 'package:flutter_nti_task/features/home/view/widgets/container_icon_widget.dart';

import '../../../../core/translations/app_strings.dart';
import '../../../../core/utils/app_color.dart';

class InProgressWorkContainerWidget extends StatelessWidget {
  const InProgressWorkContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.workTask,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Add New Features",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            ContainerIconWidget(
              imagePath: AppAssets.workIcon,
              backgroundColor: AppColors.primary,
              iconColor: Colors.white,
              width: size.width * 0.08,
              height: size.height * 0.036,
              iconWidth: size.width * 0.02,
              iconHeight: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}

class InProgressHomeContainerWidget extends StatelessWidget {
  const InProgressHomeContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkLight,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.homeTask,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Add new feature for Do It app and commit it",
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            ContainerIconWidget(
              imagePath: AppAssets.homeIcon,
              backgroundColor: AppColors.pink,
              iconColor: Colors.white,
              width: size.width * 0.08,
              height: size.height * 0.036,
              iconWidth: size.width * 0.02,
              iconHeight: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class InProgressPersonalContainerWidget extends StatelessWidget {
  const InProgressPersonalContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: AppColors.sky,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.personalTask,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Improve my English skills by trying to speak",
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            ContainerIconWidget(
              imagePath: AppAssets.personalIcon,
              backgroundColor: AppColors.primary,
              iconColor: Colors.white,
              width: size.width * 0.08,
              height: size.height * 0.036,
              iconWidth: size.width * 0.02,
              iconHeight: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
