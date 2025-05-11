import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/add_task/data/models/category_model.dart';
import 'package:flutter_nti_task/features/add_task/manager/add_task_cubit/add_task_cubit.dart';

import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/translations/app_strings.dart';
import '../../../../core/utils/app_color.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  const MyDropdownButtonFormField({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DropdownButtonFormField<CategoryModel>(
      validator: (value) {
        if (value == null) {
          return 'Please select';
        }
        return null;
      },
      items: AddTaskCubit.get(context)
          .categories
          .map((category) => DropdownMenuItem(
              value: category,
              child: Row(
                children: [
                  category.icon,
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(category.title),
                ],
              )))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          AddTaskCubit.get(context).changeGroup(value);
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        enabledBorder:
            AppBorderDecoration.formFieldDecoration(Color(0xffCDCDCD)),
        focusedBorder:
            AppBorderDecoration.formFieldDecoration(AppColors.primary),
        errorBorder: AppBorderDecoration.formFieldDecoration(AppColors.red),
        focusedErrorBorder:
            AppBorderDecoration.formFieldDecoration(AppColors.red),
        hintText: AppStrings.groupHint,
        hintStyle: TextStyle(color: AppColors.grey),
        fillColor: AppColors.white,
        filled: true,
      ),
    );
  }
}
