import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/home/view/widgets/container_icon_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/state_container.dart';

import '../../../../Core/utils/app_color.dart';
import '../../../../core/utils/app_assets.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String states;
  final String category;

  const TaskWidget(
      {super.key,
      required this.title,
      required this.states,
      required this.category});

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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 3,
            color: AppColors.lightGrey,
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            child: Image.asset(
              AppAssets.mainImage,
              height: size.height * 0.09,
              width: size.width * 0.17,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    StateContainer(
                      status: states == "InProgress"
                          ? Status.inProgress
                          : states == "Done"
                              ? Status.done
                              : Status.missed,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    ContainerIconWidget(
                      imagePath: category == "Work"
                          ? AppAssets.workIcon
                          : category == "Personal"
                              ? AppAssets.personalIcon
                              : AppAssets.homeIcon,
                      backgroundColor: category == "Work"
                          ? AppColors.black
                          : category == "Personal"
                              ? AppColors.primary
                              : AppColors.pink,
                      iconColor: category == "Work"
                          ? AppColors.white
                          : category == "Personal"
                              ? AppColors.sky
                              : AppColors.darkLight,
                      width: size.width * 0.08,
                      height: size.height * 0.036,
                      iconWidth: size.width * 0.2,
                      iconHeight: size.height * 0.4,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
