import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/auth/manager/register_cubit/register_state.dart';
import 'package:flutter_nti_task/features/auth/view/login_screen.dart';
import 'package:flutter_nti_task/features/auth/view/widgets/have_account.dart';
import 'package:flutter_nti_task/features/home/manager/user_cubit/user_cubit.dart';
import 'package:flutter_nti_task/features/home/view/home_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/image_manager/image_manager_view.dart';
import '../../../core/shared_widgets/main_application_image.dart';
import '../../../core/shared_widgets/title_text_widget.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../manager/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5F4),
        body: BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
          child: Builder(builder: (context) {
            RegisterCubit registerCubit = RegisterCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  ImageManagerView(
                      onPicked: (XFile image) {
                        registerCubit.image = image;
                      },
                      pickedBody: (XFile image) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: FileImage(File(image.path)),
                                  fit: BoxFit.cover)),
                        );
                      },
                      unPickedBody: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          AppAssets.mainImage,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.07,
                        vertical: size.height * 0.02),
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          UserCubit.get(context).getUserData(user: state.user);

                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.routeName, (route) => false);
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: registerCubit.formKey,
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
                                controller: registerCubit.usernameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return AppStrings.validationUsernameMessage;
                                  }
                                  return null;
                                },
                                prefixIcon:
                                    AppSvgIcon(imagePath: AppAssets.person),
                              ),
                              SizedBox(
                                height: size.height * 0.016,
                              ),
                              AppTextField(
                                hintText: AppStrings.passwordHint,
                                labelText: AppStrings.passwordLabel,
                                controller: registerCubit.passwordController,
                                obscureText: registerCubit.obscureText,
                                prefixIcon:
                                    AppSvgIcon(imagePath: AppAssets.password),
                                suffixIcon: InkWell(
                                  onTap:
                                      registerCubit.onPasswordSuffixIconPressed,
                                  child: AppSvgIcon(
                                    imagePath: registerCubit.obscureText
                                        ? AppAssets.lock
                                        : AppAssets.unLock,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      value.length < 6) {
                                    return AppStrings
                                        .validationPasswordMessageSize;
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
                                    registerCubit.confirmPasswordController,
                                obscureText: registerCubit.confirmObscureText,
                                prefixIcon:
                                    AppSvgIcon(imagePath: AppAssets.password),
                                suffixIcon: InkWell(
                                  onTap: registerCubit
                                      .onConfirmPasswordSuffixIconPressed,
                                  child: AppSvgIcon(
                                    imagePath: registerCubit.confirmObscureText
                                        ? AppAssets.lock
                                        : AppAssets.unLock,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return AppStrings
                                        .validationPasswordMessageSize;
                                  }
                                  if (value !=
                                      registerCubit.passwordController.text) {
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
                                buttonText: AppStrings.registerButton,
                                textStyle: TextStyle(
                                    fontSize: 20, color: AppColors.white),
                                onPressed: registerCubit.onRegisterPressed,
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
