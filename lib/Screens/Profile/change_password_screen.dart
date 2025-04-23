import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/Login%20&%20register/login_screen.dart';
import 'package:flutter_nti_task/Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/Widgets/app_text_field.dart';
import 'package:flutter_nti_task/Widgets/have_account.dart';
import 'package:flutter_nti_task/Widgets/main_application_image.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "ChangePasswordScreen";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool confirmObscureText = true;
  bool oldObscureText = true;

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
                    Text("Change Password",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary)),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    AppTextField(
                      hintText: "Enter Old Password",
                      labelText: "Old Password",
                      controller: oldPasswordController,
                      obscureText: oldObscureText,
                      prefixIcon: AppSvg(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            oldObscureText = !oldObscureText;
                          });
                        },
                        child: AppSvg(
                          imagePath: oldObscureText
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
                    AppTextField(
                      hintText: "Enter New Password",
                      labelText: "New Password",
                      controller: newPasswordController,
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
                      labelText: "Confirm Password",
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
                      buttonText: "Save",
                      textStyle:
                          TextStyle(fontSize: 20, color: AppColors.white),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.pop(context);
                      },
                    ),
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
