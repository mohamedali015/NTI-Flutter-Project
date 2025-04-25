import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_theme.dart';
import 'package:flutter_nti_task/Features/Home/View/empty_tasks_screen.dart';
import 'package:flutter_nti_task/Features/Profile/View/change_password_screen.dart';
import 'package:flutter_nti_task/Features/Auth/View/login_screen.dart';
import 'package:flutter_nti_task/Features/Auth/View/register_screen.dart';
import 'package:flutter_nti_task/Features/Profile/View/home_profile_screen.dart';
import 'package:flutter_nti_task/Features/Splash%20&%20Welcome/View/splash_screen.dart';
import 'package:flutter_nti_task/Features/Splash%20&%20Welcome/View/welcome_screen.dart';

import 'Features/Home/View/add_task_screen.dart';
import 'Features/Home/View/task_screen.dart';
import 'Features/Profile/View/setting_screen.dart';
import 'Features/Profile/View/update_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        EmptyTasksScreen.routeName: (_) => EmptyTasksScreen(),
        TasksScreen.routeName: (_) => TasksScreen(),
        AddTaskScreen.routeName: (_) => AddTaskScreen(),
        HomeProfileScreen.routeName: (_) => HomeProfileScreen(),
        UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
        ChangePasswordScreen.routeName: (_) => ChangePasswordScreen(),
        SettingScreen.routeName: (_) => SettingScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.lightTheme,
    );
  }
}
