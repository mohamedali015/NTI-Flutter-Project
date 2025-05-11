import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/Core/utils/app_assets.dart';
import 'package:flutter_nti_task/features/home/manager/user_cubit/user_cubit.dart';
import '../../../../core/translations/app_strings.dart';
import '../../../../core/utils/app_color.dart';
import '../../manager/user_cubit/user_state.dart';

class MyappBarRow extends StatelessWidget {
  final String imagePath;
  final VoidCallback rowOnPressed;

  const MyappBarRow({
    super.key,
    required this.imagePath,
    required this.rowOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: rowOnPressed,
      child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return Row(
          children: [
            if (state is UserGetSuccess)
              CircleAvatar(
                backgroundImage: FileImage(File(state.userModel.image!)),
                radius: size.width * 0.075,
              ),
            if (state is! UserGetSuccess)
              CircleAvatar(
                backgroundImage: AssetImage(
                  AppAssets.mainImage,
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
                if (state is UserGetSuccess)
                  Text(state.userModel.userName ?? 'No Name',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: AppColors.lightBlack)),
              ],
            ),
          ],
        );
      }),
    );
  }
}
