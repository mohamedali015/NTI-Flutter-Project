import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/core/cache/cache_data.dart';
import 'package:flutter_nti_task/core/cache/cache_helper.dart';
import 'package:flutter_nti_task/core/translations/translation_helper.dart';
import 'package:get/get.dart';
import 'core/utils/app_theme.dart';
import 'features/auth/view/login_screen.dart';
import 'features/auth/view/register_screen.dart';
import 'features/home/manager/user_cubit/user_cubit.dart';
import 'features/add_task/view/add_task_screen.dart';
import 'features/home/view/empty_tasks_screen.dart';
import 'features/home/view/home_screen.dart';
import 'features/home/view/task_screen.dart';
import 'features/profile/view/change_password_screen.dart';
import 'features/profile/view/home_profile_screen.dart';
import 'features/profile/view/setting_screen.dart';
import 'features/profile/view/update_profile_screen.dart';
import 'features/splash_and_welcome/view/splash_screen.dart';
import 'features/splash_and_welcome/view/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: GetMaterialApp(
        locale: Locale(CacheDate.lang!),
        translations: TranslationHelper(),
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
          HomeScreen.routeName: (_) => HomeScreen(),
        },
        initialRoute: SplashScreen.routeName,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
