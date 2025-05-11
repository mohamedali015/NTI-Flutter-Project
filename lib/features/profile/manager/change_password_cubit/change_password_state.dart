abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String error;

  ChangePasswordErrorState({required this.error});
}

class ChangePasswordVisibilityState extends ChangePasswordState {}
