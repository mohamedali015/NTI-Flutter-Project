import 'package:flutter/material.dart';

import 'package:flutter_nti_task/Core/Shared%20Widgets/main_application_image.dart';

import '../../../Core/Shared Widgets/app_elevated_button.dart';
import '../../../Core/Shared Widgets/app_svg_icon.dart';
import '../../../Core/Shared Widgets/app_text_field.dart';
import '../../../Core/Shared Widgets/title_text_widget.dart';
import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_assets.dart';
import '../../../Core/utils/app_color.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = "UpdateProfileScreen";

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();

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
                    TitleTextWidget(text: AppStrings.updateProfile),
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
                      height: size.height * 0.03,
                    ),
                    AppElevatedButton(
                      buttonText: AppStrings.updateProfileButton,
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
