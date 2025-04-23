import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/Login%20&%20register/login_screen.dart';
import 'package:flutter_nti_task/Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/Widgets/app_text_field.dart';
import 'package:flutter_nti_task/Widgets/have_account.dart';
import 'package:flutter_nti_task/Widgets/main_application_image.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainApplicationImage(imagePath: AppAssets.mainImage),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.height * 0.02),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Register",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary)),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    AppTextField(
                      hintText: "Enter Username",
                      labelText: "Username",
                      controller: usernameController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid username!';
                        }
                        return null;
                      },
                      prefixIcon: AppSvg(imagePath: AppAssets.person),
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: "Enter Password",
                      labelText: "Password",
                      controller: passwordController,
                      obscureText: obscureText,
                      prefixIcon: AppSvg(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: AppSvg(
                          imagePath:
                              obscureText ? AppAssets.lock : AppAssets.unLock,
                        ),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: "Confirm Password",
                      labelText: "Password",
                      controller: confirmPasswordController,
                      obscureText: confirmObscureText,
                      prefixIcon: AppSvg(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            confirmObscureText = !confirmObscureText;
                          });
                        },
                        child: AppSvg(
                          imagePath: confirmObscureText
                              ? AppAssets.lock
                              : AppAssets.unLock,
                        ),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppElevatedButton(
                      buttonText: "Register",
                      textStyle:
                          TextStyle(fontSize: 20, color: AppColors.white),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) => false,
                        );
                      },
                      routeName: LoginScreen.routeName,
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    HaveAccount(
                      text: "Already Have An Account?",
                      buttonText: "Login",
                      routeName: LoginScreen.routeName,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
