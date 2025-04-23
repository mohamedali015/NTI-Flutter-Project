import 'package:flutter/material.dart';
import 'package:flutter_nti_task/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String imagePath;

  // final double? width;
  // final double? height;
  bool isFormSvg;

  AppSvg({super.key, required this.imagePath, this.isFormSvg = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IconButton(
      onPressed: null,
      icon: SvgPicture.asset(
        imagePath,
        color: AppColors.black,
        width: isFormSvg ? size.width * 0.032 : size.width * 0.04,
        height: isFormSvg ? size.height * 0.032 : size.height * 0.04,
        // fit: BoxFit.scaleDown,
      ),
    );
  }
}
