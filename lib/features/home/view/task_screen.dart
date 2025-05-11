import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/add_task/view/add_task_screen.dart';
import 'package:flutter_nti_task/features/home/view/widgets/app_floating_action_button.dart';
import 'package:flutter_nti_task/features/home/view/widgets/custom_home_title_row_widget.dart';
import 'package:flutter_nti_task/features/home/view/widgets/myapp_bar_row.dart';
import 'package:flutter_nti_task/features/home/view/widgets/task_widget.dart';

import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../profile/view/home_profile_screen.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = "TasksScreen";
  int tasksNumber = 10;

  TasksScreen({super.key});

  List<Widget> tasks = [
    TaskWidget(
      title: "Go to supermarket to buy some milk & eggs",
      states: "InProgress",
      category: "Work",
    ),
    TaskWidget(
      title: "Go to supermarket to buy some milk & eggs",
      states: "Done",
      category: "Personal",
    ),
    TaskWidget(
      title: "Improve my English skills by trying to speak",
      states: "Missed",
      category: "Home",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppSvgIcon(imagePath: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.tasks,
        ),
        centerTitle: true,
        toolbarHeight: size.height * 0.085,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.04,
        ),
        child: ListView(
          children: [
            // todo: search box here

            CustomHomeTitleRowWidget(
              tasksNumber: tasksNumber,
              title: AppStrings.result,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => tasks[index],
              itemCount: tasks.length,
              separatorBuilder: (context, index) => SizedBox(
                height: size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AppFloatingActionButton(
        imagePath: AppAssets.filter,
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
