import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/login_screen.dart';
import 'package:flutter_nti_task/Screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      routes: {
        SignupScreen.routeName: (_) => SignupScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
