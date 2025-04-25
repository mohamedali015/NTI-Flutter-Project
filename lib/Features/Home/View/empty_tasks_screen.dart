import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Features/Profile/View/home_profile_screen.dart';
import 'package:flutter_nti_task/Features/Home/View/Widgets/myapp_bar_row.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_assets.dart';

class EmptyTasksScreen extends StatelessWidget {
  static const String routeName = "EmptyTasksScreen";

  const EmptyTasksScreen({super.key});

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
    );
  }
}
