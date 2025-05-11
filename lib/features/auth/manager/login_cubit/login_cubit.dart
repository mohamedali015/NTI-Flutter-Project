import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/auth/manager/login_cubit/login_state.dart';
import 'package:flutter_nti_task/features/home/data/model/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscureText = true;

  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void onLoginPressed() {
    emit(LoginLoadingState());

    if (!formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      return emit(LoginErrorState(error: 'error'));
    }
    UserModel user = UserModel(userName: usernameController.text);
    emit(LoginSuccessState(user: user));
  }

  void onSuffixIconPressed() {
    obscureText = !obscureText;
    emit(LoginShowPasswordState());
  }
}
