import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/add_task_screen.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';
import 'package:flutter_svg/svg.dart';

class MyappBarRow extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool? iconVisible;
  final VoidCallback rowOnPressed;

  MyappBarRow(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.rowOnPressed,
      this.iconVisible = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: rowOnPressed,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  imagePath,
                ),
                radius: size.width * 0.075,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColors.lightBlack)),
                  Text(name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: AppColors.lightBlack)),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        if (iconVisible == true)
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddTaskScreen.routeName);
            },
            icon: AppSvg(
              imagePath: AppAssets.addNewTask,
              isFormSvg: false,
            ),
          ),
      ],
    );
  }
}
