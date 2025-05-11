import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/profile/view/change_password_screen.dart';
import 'package:flutter_nti_task/features/profile/view/setting_screen.dart';
import 'package:flutter_nti_task/features/profile/view/update_profile_screen.dart';
import 'package:flutter_nti_task/features/profile/view/widgets/home_profile_row.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../home/view/widgets/myapp_bar_row.dart';

class HomeProfileScreen extends StatelessWidget {
  static const String routeName = "HomeProfileScreen";

  const HomeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: MyappBarRow(
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
