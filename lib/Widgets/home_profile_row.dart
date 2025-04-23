import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class HomeProfileRow extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback rowOnPressed;

  const HomeProfileRow(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.rowOnPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: rowOnPressed,
      child: Container(
        width: size.width,
        height: size.height * 0.09,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(size.height * 0.02),
        ),
        child: Row(
          children: [
            AppSvg(imagePath: imagePath, isFormSvg: false),
            SizedBox(width: size.width * 0.03),
            Text(name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            Spacer(),
            AppSvg(imagePath: AppAssets.arrow, isFormSvg: false),
          ],
        ),
      ),
    );
  }
}
