import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/shared_widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/features/auth/view/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "WelcomeScreen";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            SvgPicture.asset(
              AppAssets.welcome,
              width: double.infinity,
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              child: Text(
                AppStrings.welcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Text(
                AppStrings.welcomeDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            AppElevatedButton(
                buttonText: AppStrings.welcomeButton,
                textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    LoginScreen.routeName,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
