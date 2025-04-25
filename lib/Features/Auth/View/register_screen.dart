import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/Shared%20Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Features/Auth/View/login_screen.dart';
import 'package:flutter_nti_task/Features/Auth/View/widgets/have_account.dart';
import 'package:flutter_nti_task/Core/Shared%20Widgets/main_application_image.dart';

import '../../../Core/Shared Widgets/app_svg_icon.dart';
import '../../../Core/Shared Widgets/app_text_field.dart';
import '../../../Core/Shared Widgets/title_text_widget.dart';
import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';

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
                    TitleTextWidget(text: AppStrings.register),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    AppTextField(
                      hintText: AppStrings.usernameHint,
                      labelText: AppStrings.usernameLabel,
                      controller: usernameController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.validationUsernameMessage;
                        }
                        return null;
                      },
                      prefixIcon: AppSvgIcon(imagePath: AppAssets.person),
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: AppStrings.passwordHint,
                      labelText: AppStrings.passwordLabel,
                      controller: passwordController,
                      obscureText: obscureText,
                      prefixIcon: AppSvgIcon(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: AppSvgIcon(
                          imagePath:
                              obscureText ? AppAssets.lock : AppAssets.unLock,
                        ),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.validationPasswordMessageSize;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: AppStrings.confirmPasswordHint,
                      labelText: AppStrings.confirmPasswordLabel,
                      controller: confirmPasswordController,
                      obscureText: confirmObscureText,
                      prefixIcon: AppSvgIcon(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            confirmObscureText = !confirmObscureText;
                          });
                        },
                        child: AppSvgIcon(
                          imagePath: confirmObscureText
                              ? AppAssets.lock
                              : AppAssets.unLock,
                        ),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.validationPasswordMessageSize;
                        }
                        if (value != passwordController.text) {
                          return AppStrings.validationConfirmPasswordMessage;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppElevatedButton(
                      buttonText: AppStrings.registerButton,
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
                      text: AppStrings.alreadyHaveAccount,
                      buttonText: AppStrings.login,
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
