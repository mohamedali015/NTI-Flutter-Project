import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/profile/manager/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool newPassObscureText = true;
  bool confirmObscureText = true;
  bool currentObscureText = true;

  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  void onSaveButtonPressed() {
    if (!formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
      return emit(ChangePasswordErrorState(error: 'error'));
    }

    emit(ChangePasswordSuccessState());
  }

  void onCurrentPasswordPressed() {
    currentObscureText = !currentObscureText;
    emit(ChangePasswordVisibilityState());
  }

  void onNewPasswordPressed() {
    newPassObscureText = !newPassObscureText;
    emit(ChangePasswordVisibilityState());
  }

  void onConfirmPasswordPressed() {
    confirmObscureText = !confirmObscureText;
    emit(ChangePasswordVisibilityState());
  }
}
