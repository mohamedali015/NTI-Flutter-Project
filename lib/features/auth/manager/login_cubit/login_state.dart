import 'package:flutter_nti_task/features/home/data/model/user_model.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserModel user;

  LoginSuccessState({required this.user});
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}

class LoginShowPasswordState extends LoginState {}
