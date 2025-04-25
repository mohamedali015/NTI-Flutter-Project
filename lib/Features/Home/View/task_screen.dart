import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Features/Profile/View/home_profile_screen.dart';
import 'package:flutter_nti_task/Features/Home/View/Widgets/myapp_bar_row.dart';
import 'package:flutter_nti_task/Features/Home/View/Widgets/task_widget.dart';

import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = "TasksScreen";
  int tasksNumber = 3;

  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: MyappBarRow(
          name: "Mohamed Ali",
          imagePath: AppAssets.mainImage,
          rowOnPressed: () {
            Navigator.pushNamed(
              context,
              HomeProfileScreen.routeName,
            );
          },
          iconVisible: true,
        ),
        toolbarHeight: size.height * 0.085,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.04,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  AppStrings.tasks,
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
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
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => TaskWidget(),
              itemCount: tasksNumber,
              separatorBuilder: (context, index) => SizedBox(
                height: size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
