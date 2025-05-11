import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_color.dart';

class SettingWidgets extends StatelessWidget {
  final String text;
  final bool selected;
  final bool borderLeft;

  const SettingWidgets(
      {super.key,
      required this.text,
      required this.selected,
      required this.borderLeft});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.007,
      ),
      decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            bottomLeft: borderLeft
                ? Radius.circular(size.width * 0.02)
                : Radius.circular(0),
            bottomRight: borderLeft
                ? Radius.circular(0)
                : Radius.circular(size.width * 0.02),
            topLeft: borderLeft
                ? Radius.circular(size.width * 0.02)
                : Radius.circular(0),
            topRight: borderLeft
                ? Radius.circular(0)
                : Radius.circular(size.width * 0.02),
          ),
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1,
          )),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? AppColors.white : AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
