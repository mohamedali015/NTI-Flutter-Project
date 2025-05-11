import 'package:flutter_nti_task/features/add_task/data/models/task_model.dart';

abstract class GetTasksState {}

class GetTasksInitialState extends GetTasksState {}

class GetTasksSuccessState extends GetTasksState {
  List<TaskModel> tasks;

  GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends GetTasksState {
  String error;

  GetTasksErrorState({required this.error});
}
