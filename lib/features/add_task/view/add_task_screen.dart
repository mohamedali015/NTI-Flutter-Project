import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/core/shared_widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/core/shared_widgets/app_svg_icon.dart';
import 'package:flutter_nti_task/core/shared_widgets/app_text_field.dart';
import 'package:flutter_nti_task/core/shared_widgets/main_application_image.dart';
import 'package:flutter_nti_task/features/add_task/manager/add_task_cubit/add_task_cubit.dart';
import 'package:flutter_nti_task/features/add_task/manager/add_task_cubit/add_task_state.dart';
import 'package:flutter_nti_task/features/add_task/view/widgets/my_dropdown_button_form_field.dart';
import 'package:flutter_nti_task/features/home/view/task_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/shared_widgets/image_manager/image_manager_view.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = "AddTaskScreen";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Builder(builder: (context) {
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
          body: BlocConsumer<AddTaskCubit, AddTaskState>(
              listener: (context, state) {
            if (state is AddTaskSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, TasksScreen.routeName, (route) => false);
            }
          }, builder: (context, state) {
            AddTaskCubit addTaskCubit = AddTaskCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.14,
                      vertical: size.height * 0.03,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      child: ImageManagerView(
                          onPicked: (XFile image) {
                            addTaskCubit.image = image;
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
                    ),
                  ),
                  Form(
                    key: addTaskCubit.formKey,
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
                            controller: addTaskCubit.titleController,
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
                            controller: addTaskCubit.descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            validator: (value) {
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          MyDropdownButtonFormField(),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          AppElevatedButton(
                            buttonText: AppStrings.addTaskButton,
                            textStyle:
                                TextStyle(fontSize: 20, color: AppColors.white),
                            onPressed: addTaskCubit.onAddTaskPressed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
