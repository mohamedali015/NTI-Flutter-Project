import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/core/shared_widgets/main_application_image.dart';
import 'package:flutter_nti_task/features/profile/manager/update_profile_cubit/update_profile_cubit.dart';
import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';
import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/title_text_widget.dart';
import '../manager/update_profile_cubit/update_profile_state.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String routeName = "UpdateProfileScreen";

  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpdateProfileCubit(),
        child: Builder(builder: (context) {
          UpdateProfileCubit updateProfileCubit =
              UpdateProfileCubit.get(context);
          return SingleChildScrollView(
            child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    MainApplicationImage(imagePath: AppAssets.mainImage),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.height * 0.02),
                      child: Form(
                        key: updateProfileCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextWidget(text: AppStrings.updateProfile),
                            SizedBox(
                              height: size.height * 0.018,
                            ),
                            AppTextField(
                              hintText: AppStrings.usernameHint,
                              labelText: AppStrings.usernameLabel,
                              controller: updateProfileCubit.usernameController,
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
                              height: size.height * 0.03,
                            ),
                            AppElevatedButton(
                              buttonText: AppStrings.updateProfileButton,
                              textStyle: TextStyle(
                                  fontSize: 20, color: AppColors.white),
                              onPressed:
                                  updateProfileCubit.onUpdateButtonPressed,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
