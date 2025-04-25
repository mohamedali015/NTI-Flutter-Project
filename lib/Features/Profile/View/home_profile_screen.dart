import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/Translations/app_strings.dart';
import 'package:flutter_nti_task/Features/Profile/View/change_password_screen.dart';

import 'package:flutter_nti_task/Features/Profile/View/Widgets/home_profile_row.dart';
import 'package:flutter_nti_task/Features/Home/View/Widgets/myapp_bar_row.dart';
import 'package:flutter_nti_task/Features/Profile/View/setting_screen.dart';
import 'package:flutter_nti_task/Features/Profile/View/update_profile_screen.dart';

import '../../../Core/utils/app_assets.dart';

class HomeProfileScreen extends StatelessWidget {
  static const String routeName = "HomeProfileScreen";

  const HomeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: MyappBarRow(
            name: "Mohamed Ali",
            imagePath: AppAssets.mainImage,
            rowOnPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeProfileScreen.routeName,
                (route) => false,
              );
            }),
        automaticallyImplyLeading: false,
        toolbarHeight: size.height * 0.085,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.05,
        ),
        child: Column(
          children: [
            HomeProfileRow(
              name: AppStrings.updateProfile,
              imagePath: AppAssets.person,
              rowOnPressed: () {
                Navigator.pushNamed(context, UpdateProfileScreen.routeName);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            HomeProfileRow(
              name: AppStrings.changePassword,
              imagePath: AppAssets.password,
              rowOnPressed: () {
                Navigator.pushNamed(context, ChangePasswordScreen.routeName);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            HomeProfileRow(
              name: AppStrings.settings,
              imagePath: AppAssets.setting,
              rowOnPressed: () {
                Navigator.pushNamed(context, SettingScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
