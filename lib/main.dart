import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/add_task_screen.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/empty_tasks_screen.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/task_screen.dart';
import 'package:flutter_nti_task/Screens/Profile/change_password_screen.dart';
import 'package:flutter_nti_task/Screens/Login%20&%20register/login_screen.dart';
import 'package:flutter_nti_task/Screens/Login%20&%20register/register_screen.dart';
import 'package:flutter_nti_task/Screens/Profile/home_profile_screen.dart';
import 'package:flutter_nti_task/Screens/Profile/setting_screen.dart';
import 'package:flutter_nti_task/Screens/Profile/update_profile_screen.dart';
import 'package:flutter_nti_task/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter_nti_task/Screens/welcome_screen.dart';
import 'package:flutter_nti_task/utils/app_theme.dart';

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
