import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/welcome_screen.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
              context,
              WelcomeScreen.routeName,
              (route) => false,
            ));
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.splashScreen,
        ),
      ),
    );
  }
}
