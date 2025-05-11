import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/home/view/widgets/container_icon_widget.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class IconItemsDropdownButtonFormField extends StatelessWidget {
  final String category;

  const IconItemsDropdownButtonFormField({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ContainerIconWidget(
      imagePath: category == "Work"
          ? AppAssets.workIcon
          : category == "Personal"
              ? AppAssets.personalIcon
              : AppAssets.homeIcon,
      backgroundColor: category == "Work"
          ? AppColors.black
          : category == "Personal"
              ? AppColors.primary
              : AppColors.darkLight,
      iconColor: category == "Work"
          ? AppColors.white
          : category == "Personal"
              ? AppColors.sky
              : AppColors.pink,
      width: size.width * 0.1,
      height: size.height * 0.036,
      iconWidth: size.width * 0.2,
      iconHeight: size.height * 0.4,
    );
  }
}
