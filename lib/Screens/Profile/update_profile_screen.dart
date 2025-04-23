import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/empty_tasks_screen.dart';
import 'package:flutter_nti_task/Screens/Profile/change_password_screen.dart';
import 'package:flutter_nti_task/Screens/Login%20&%20register/register_screen.dart';
import 'package:flutter_nti_task/Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/Widgets/app_text_field.dart';
import 'package:flutter_nti_task/Widgets/have_account.dart';
import 'package:flutter_nti_task/Widgets/main_application_image.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    Text("Update Profile",
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
                      height: size.height * 0.03,
                    ),
                    AppElevatedButton(
                      buttonText: "Update",
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
