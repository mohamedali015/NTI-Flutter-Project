import 'package:flutter_nti_task/features/add_task/data/models/task_model.dart';

class TaskRepo {
  final List<TaskModel> _tasks = [];

  void addTask(TaskModel task) {
    _tasks.add(task);
  }

  List<TaskModel> getTasks() => _tasks;
}
