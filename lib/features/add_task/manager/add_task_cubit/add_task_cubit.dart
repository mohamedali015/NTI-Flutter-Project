import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/add_task/data/models/category_model.dart';
import 'package:flutter_nti_task/features/add_task/data/models/task_model.dart';
import 'package:flutter_nti_task/features/add_task/manager/add_task_cubit/add_task_state.dart';
import 'package:flutter_nti_task/features/add_task/view/widgets/icon_items_dropdown_button_form_field.dart';
import 'package:flutter_nti_task/features/home/data/repo/task_repo.dart';
import 'package:image_picker/image_picker.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Home',
      icon: IconItemsDropdownButtonFormField(category: "Home"),
    ),
    CategoryModel(
      title: 'Personal',
      icon: IconItemsDropdownButtonFormField(category: "Personal"),
    ),
    CategoryModel(
      title: 'Work',
      icon: IconItemsDropdownButtonFormField(category: "Work"),
    ),
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? endDate;
  CategoryModel? group;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeEndDate(DateTime date) {
    endDate = date;
    emit(AddTaskChangeEndDateState());
  }

  void changeGroup(CategoryModel group) {
    this.group = group;
    emit(AddTaskChangeGroupState());
  }

  void onAddTaskPressed() {
    emit(AddTaskLoadingState());
    if (!formKey.currentState!.validate()) return;
    taskRepo.addTask(TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      group: group!.title,
    ));
    emit(AddTaskSuccessState());
  }

  XFile? image;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTaskChangeImageState());
  }

  TaskRepo taskRepo = TaskRepo();
}
