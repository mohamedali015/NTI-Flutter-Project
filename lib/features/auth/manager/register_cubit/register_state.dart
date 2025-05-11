import 'package:flutter_nti_task/features/home/data/model/user_model.dart';

abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  UserModel user;

  RegisterSuccessState({required this.user});
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}

class RegisterShowPasswordState extends RegisterState {}
