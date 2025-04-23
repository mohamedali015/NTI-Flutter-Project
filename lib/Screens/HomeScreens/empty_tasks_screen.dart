import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/Profile/home_profile_screen.dart';
import 'package:flutter_nti_task/Widgets/myapp_bar_row.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  "There are no tasks yet, Press the button To add New Task ",
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
