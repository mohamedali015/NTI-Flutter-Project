import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/shared_widgets/custom_svg.dart';

import '../utils/app_color.dart';

class AppSvgIcon extends StatelessWidget {
  final String imagePath;

  // final double? width;
  // final double? height;
  bool isFormSvg;

  AppSvgIcon({super.key, required this.imagePath, this.isFormSvg = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IconButton(
      onPressed: null,
      // custom widget here
      icon: CustomSvg(
        path: imagePath,
        color: AppColors.lightBlack,
        width: isFormSvg ? size.width * 0.032 : size.width * 0.04,
        height: isFormSvg ? size.height * 0.032 : size.height * 0.04,
        // fit: BoxFit.scaleDown,
      ),
    );
  }
}
