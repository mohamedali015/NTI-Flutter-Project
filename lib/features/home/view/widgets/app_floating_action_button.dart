import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/shared_widgets/custom_svg.dart';
import 'package:flutter_nti_task/features/add_task/view/add_task_screen.dart';
import '../../../../core/utils/app_color.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton(
      {super.key, required this.imagePath, required this.onPressed});

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      shape: CircleBorder(),
      child: CustomSvg(
        path: imagePath,
        width: size.width * 0.025,
        height: size.height * 0.025,
      ),
    );
  }
}
