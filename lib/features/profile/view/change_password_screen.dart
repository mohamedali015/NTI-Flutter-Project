import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/Core/Translations/app_strings.dart';
import 'package:flutter_nti_task/core/shared_widgets/title_text_widget.dart';
import 'package:flutter_nti_task/features/profile/manager/change_password_cubit/change_password_cubit.dart';
import 'package:flutter_nti_task/features/profile/manager/change_password_cubit/change_password_state.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';
import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/main_application_image.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = "ChangePasswordScreen";

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F4),
      body: BlocProvider(
        create: (BuildContext context) => ChangePasswordCubit(),
        child: Builder(builder: (context) {
          ChangePasswordCubit changePasswordCubit =
              ChangePasswordCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                MainApplicationImage(imagePath: AppAssets.mainImage),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * 0.02),
                  child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                      listener: (context, state) {
                    if (state is ChangePasswordSuccessState) {
                      Navigator.pop(context);
                    }
                  }, builder: (context, state) {
                    return Form(
                      key: changePasswordCubit.formKey,
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
                            controller:
                                changePasswordCubit.currentPasswordController,
                            obscureText: changePasswordCubit.currentObscureText,
                            prefixIcon:
                                AppSvgIcon(imagePath: AppAssets.password),
                            suffixIcon: InkWell(
                              onTap:
                                  changePasswordCubit.onCurrentPasswordPressed,
                              child: AppSvgIcon(
                                imagePath:
                                    changePasswordCubit.currentObscureText
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
                            controller:
                                changePasswordCubit.newPasswordController,
                            obscureText: changePasswordCubit.newPassObscureText,
                            prefixIcon:
                                AppSvgIcon(imagePath: AppAssets.password),
                            suffixIcon: InkWell(
                              onTap: changePasswordCubit.onNewPasswordPressed,
                              child: AppSvgIcon(
                                imagePath:
                                    changePasswordCubit.newPassObscureText
                                        ? AppAssets.lock
                                        : AppAssets.unLock,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty || value.length < 6) {
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
                            controller:
                                changePasswordCubit.confirmPasswordController,
                            obscureText: changePasswordCubit.confirmObscureText,
                            prefixIcon:
                                AppSvgIcon(imagePath: AppAssets.password),
                            suffixIcon: InkWell(
                              onTap:
                                  changePasswordCubit.onConfirmPasswordPressed,
                              child: AppSvgIcon(
                                imagePath:
                                    changePasswordCubit.confirmObscureText
                                        ? AppAssets.lock
                                        : AppAssets.unLock,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return AppStrings.validationPasswordMessageSize;
                              }
                              if (value !=
                                  changePasswordCubit
                                      .newPasswordController.text) {
                                return AppStrings
                                    .validationConfirmPasswordMessage;
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
                            onPressed: changePasswordCubit.onSaveButtonPressed,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
