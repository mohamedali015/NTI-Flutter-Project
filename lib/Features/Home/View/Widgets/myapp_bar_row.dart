import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_assets.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';
import '../../../../Core/Shared Widgets/app_svg_icon.dart';
import '../../../../Core/Translations/app_strings.dart';
import '../add_task_screen.dart';

class MyappBarRow extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool? iconVisible;
  final VoidCallback rowOnPressed;

  const MyappBarRow(
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
                  Text(AppStrings.hello,
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
            icon: AppSvgIcon(
              imagePath: AppAssets.addNewTask,
              isFormSvg: false,
            ),
          ),
      ],
    );
  }
}
