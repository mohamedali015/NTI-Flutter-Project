import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/Shared%20Widgets/main_application_image.dart';
import 'package:flutter_nti_task/Core/Shared%20Widgets/title_text_widget.dart';
import 'package:flutter_nti_task/Core/Translations/app_strings.dart';
import '../../../Core/Shared Widgets/app_elevated_button.dart';
import '../../../Core/Shared Widgets/app_svg_icon.dart';
import '../../../Core/Shared Widgets/app_text_field.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "ChangePasswordScreen";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool confirmObscureText = true;
  bool currentObscureText = true;

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
                    TitleTextWidget(text: AppStrings.changePassword),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    AppTextField(
                      hintText: AppStrings.currentPasswordHint,
                      labelText: AppStrings.currentPasswordLabel,
                      controller: currentPasswordController,
                      obscureText: currentObscureText,
                      prefixIcon: AppSvgIcon(imagePath: AppAssets.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            currentObscureText = !currentObscureText;
                          });
                        },
                        child: AppSvgIcon(
                          imagePath: currentObscureText
                              ? AppAssets.lock
                              : AppAssets.unLock,
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
                      hintText: AppStrings.newPasswordHint,
                      labelText: AppStrings.newPasswordLabel,
                      controller: newPasswordController,
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
                        if (value != newPasswordController.text) {
                          return AppStrings.validationConfirmPasswordMessage;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppElevatedButton(
                      buttonText: AppStrings.saveButton,
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
