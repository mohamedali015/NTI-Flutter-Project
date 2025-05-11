import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/core/shared_widgets/main_application_image.dart';
import 'package:flutter_nti_task/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:flutter_nti_task/features/auth/manager/login_cubit/login_state.dart';
import 'package:flutter_nti_task/features/auth/view/register_screen.dart';
import 'package:flutter_nti_task/features/auth/view/widgets/have_account.dart';
import 'package:flutter_nti_task/features/home/manager/user_cubit/user_cubit.dart';
import 'package:flutter_nti_task/features/home/view/home_screen.dart';

import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/title_text_widget.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../home/view/empty_tasks_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: Builder(builder: (context) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                MainApplicationImage(imagePath: AppAssets.mainImage),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * 0.02),
                  child: BlocConsumer<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Form(
                        key: loginCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextWidget(text: AppStrings.login),
                            SizedBox(
                              height: size.height * 0.018,
                            ),
                            AppTextField(
                              hintText: AppStrings.usernameHint,
                              labelText: AppStrings.usernameLabel,
                              controller: loginCubit.usernameController,
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
                              controller: loginCubit.passwordController,
                              obscureText: loginCubit.obscureText,
                              prefixIcon:
                                  AppSvgIcon(imagePath: AppAssets.password),
                              suffixIcon: IconButton(
                                onPressed: loginCubit.onSuffixIconPressed,
                                icon: AppSvgIcon(
                                  imagePath: loginCubit.obscureText
                                      ? AppAssets.lock
                                      : AppAssets.unLock,
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty || value.length < 6) {
                                  return AppStrings
                                      .validationPasswordMessageSize;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: size.height * 0.016,
                            ),
                            AppElevatedButton(
                              buttonText: AppStrings.loginButton,
                              textStyle: TextStyle(
                                  fontSize: 20, color: AppColors.white),
                              onPressed: loginCubit.onLoginPressed,
                            ),
                            SizedBox(
                              height: size.height * 0.018,
                            ),
                            HaveAccount(
                              text: AppStrings.haveAccount,
                              buttonText: AppStrings.registerButton,
                              routeName: RegisterScreen.routeName,
                            ),
                          ],
                        ),
                      );
                    },
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        UserCubit.get(context).getUserData(user: state.user);
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routeName, (route) => false);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
