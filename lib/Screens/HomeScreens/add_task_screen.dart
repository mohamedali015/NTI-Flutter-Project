import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Screens/HomeScreens/task_screen.dart';
import 'package:flutter_nti_task/Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/Widgets/app_text_field.dart';
import 'package:flutter_nti_task/Widgets/main_application_image.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

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
          icon: AppSvg(imagePath: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add Task"),
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
                      hintText: "Enter Title",
                      labelText: "Title",
                      controller: titleController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid title!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                    AppTextField(
                      hintText: "Enter Description",
                      labelText: "Description",
                      controller: descriptionController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    AppElevatedButton(
                      buttonText: "Add Task",
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
