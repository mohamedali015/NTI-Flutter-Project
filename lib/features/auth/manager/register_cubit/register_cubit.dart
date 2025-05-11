import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/auth/manager/register_cubit/register_state.dart';
import 'package:flutter_nti_task/features/home/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  String? _error;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool confirmObscureText = true;
  XFile? image;

  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void onRegisterPressed() {
    emit(RegisterLoadingState());

    if (!formKey.currentState!.validate()) {
      _error = 'error';
      return emit(RegisterErrorState(error: _error!));
    }
    UserModel user =
        UserModel(image: image!.path, userName: usernameController.text);
    emit(RegisterSuccessState(user: user));
  }

  void onPasswordSuffixIconPressed() {
    obscureText = !obscureText;
    emit(RegisterShowPasswordState());
  }

  void onConfirmPasswordSuffixIconPressed() {
    confirmObscureText = !confirmObscureText;
    emit(RegisterShowPasswordState());
  }
}
