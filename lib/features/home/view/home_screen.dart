import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/add_task/view/add_task_screen.dart';
import 'package:flutter_nti_task/features/home/view/widgets/app_floating_action_button.dart';
import 'package:flutter_nti_task/features/home/view/widgets/custom_task_group_row_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/inprogress_category_builder.dart';
import 'package:flutter_nti_task/features/home/view/widgets/inprogress_category_containers_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/custom_home_title_row_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/myapp_bar_row.dart';
import 'package:flutter_nti_task/features/home/view/widgets/task_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/view_tasks_container_widget.dart';

import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../profile/view/home_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  int tasksNumber = 10;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: MyappBarRow(
          imagePath: AppAssets.mainImage,
          rowOnPressed: () {
            Navigator.pushNamed(
              context,
              HomeProfileScreen.routeName,
            );
          },
        ),
        toolbarHeight: size.height * 0.085,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.03,
        ),
        child: ListView(
          children: [
            ViewTasksContainerWidget(
              percentage: 80,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomHomeTitleRowWidget(
              tasksNumber: 5,
              title: AppStrings.inProgress,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InprogressCategoryBuilder(),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomHomeTitleRowWidget(
              title: AppStrings.taskGroups,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTaskGroupRowWidget(
              imagePath: AppAssets.personalIcon,
              backgroundColor: AppColors.sky,
              iconColor: AppColors.primary,
              title: AppStrings.personalTask,
              tasksNumber: 5,
              onPressed: () {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTaskGroupRowWidget(
              imagePath: AppAssets.homeIcon,
              backgroundColor: AppColors.darkLight,
              iconColor: AppColors.pink,
              title: AppStrings.homeTask,
              tasksNumber: 3,
              onPressed: () {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTaskGroupRowWidget(
              imagePath: AppAssets.workIcon,
              backgroundColor: AppColors.black,
              iconColor: AppColors.white,
              title: AppStrings.workTask,
              tasksNumber: 1,
              onPressed: () {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
      floatingActionButton: AppFloatingActionButton(
        imagePath: AppAssets.addTask,
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddTaskScreen.routeName,
          );
        },
      ),
    );
  }
}
