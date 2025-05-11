import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/add_task/data/models/task_model.dart';
import 'package:flutter_nti_task/features/home/data/repo/task_repo.dart';
import 'package:flutter_nti_task/features/home/manager/get_task_cubit/get_task_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  List<TaskModel> tasksList = [];

  void getTasks() {
    TaskRepo tasks = TaskRepo();
    tasksList = tasks.getTasks();
    emit(GetTasksSuccessState(tasks: tasksList));
  }
}
