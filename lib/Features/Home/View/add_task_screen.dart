import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Core/utils/app_assets.dart';
import 'package:flutter_nti_task/Features/Home/View/task_screen.dart';
import 'package:flutter_nti_task/Core/Shared%20Widgets/main_application_image.dart';

import '../../../Core/Shared Widgets/app_elevated_button.dart';
import '../../../Core/Shared Widgets/app_svg_icon.dart';
import '../../../Core/Shared Widgets/app_text_field.dart';
import '../../../Core/Translations/app_strings.dart';
import '../../../Core/utils/app_color.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = "AddTaskScreen";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppSvgIcon(imagePath: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.addTask),
        centerTitle: true,
        toolbarHeight: size.height * 0.085,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.14,
                vertical: size.height * 0.03,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                child: MainApplicationImage(
                  imagePath: AppAssets.mainImage,
                  height: size.height * 0.27,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.07,
                    vertical: size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      hintText: AppStrings.titleHint,
                      labelText: AppStrings.titleLabel,
                      controller: titleController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.validationTitleMessage;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: AppStrings.descriptionHint,
                      labelText: AppStrings.descriptionLabel,
                      controller: descriptionController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    AppElevatedButton(
                      buttonText: AppStrings.addTaskButton,
                      textStyle:
                          TextStyle(fontSize: 20, color: AppColors.white),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.pushNamedAndRemoveUntil(
                            context, TasksScreen.routeName, (route) => false);
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
