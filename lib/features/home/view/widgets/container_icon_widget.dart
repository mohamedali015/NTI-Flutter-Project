import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/shared_widgets/custom_svg.dart';

class ContainerIconWidget extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;

  const ContainerIconWidget(
      {super.key,
      required this.imagePath,
      required this.backgroundColor,
      required this.iconColor,
      required this.width,
      required this.height,
      required this.iconWidth,
      required this.iconHeight});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(
          size.width * 0.02,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Center(
          child: CustomSvg(
            path: imagePath,
            width: iconWidth,
            height: iconHeight,
            color: iconColor,
          ),
        ));
  }
}
