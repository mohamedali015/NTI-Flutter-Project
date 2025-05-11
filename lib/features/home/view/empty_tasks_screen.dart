import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/utils/app_assets.dart';
import 'package:flutter_nti_task/features/add_task/view/add_task_screen.dart';
import 'package:flutter_nti_task/features/home/view/widgets/app_floating_action_button.dart';
import 'package:flutter_nti_task/features/home/view/widgets/myapp_bar_row.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/translations/app_strings.dart';
import '../../profile/view/home_profile_screen.dart';

class EmptyTasksScreen extends StatelessWidget {
  static const String routeName = "EmptyTasksScreen";

  const EmptyTasksScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
                child: Text(
                  AppStrings.emptyData,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppAssets.emptyTasks,
                width: double.infinity,
                height: size.height * 0.45,
              ),
            ],
          ),
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
