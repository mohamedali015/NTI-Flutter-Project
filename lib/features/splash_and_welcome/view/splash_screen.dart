import 'package:flutter/material.dart';
import 'package:flutter_nti_task/core/cache/cache_helper.dart';
import 'package:flutter_nti_task/core/cache/cache_key.dart';
import 'package:flutter_nti_task/features/auth/view/login_screen.dart';
import 'package:flutter_nti_task/features/splash_and_welcome/view/welcome_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (CacheHelper.getData(key: CacheKeys.firstTime) == null) {
      CacheHelper.saveData(key: CacheKeys.firstTime, value: false);
      Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
                context,
                WelcomeScreen.routeName,
                (route) => false,
              ));
    } else {
      Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.splashScreen,
        ),
      ),
    );
  }
}
