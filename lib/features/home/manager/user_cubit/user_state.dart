import 'package:flutter_nti_task/features/home/data/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserGetSuccess extends UserState {
  UserModel userModel;

  UserGetSuccess({required this.userModel});
}
