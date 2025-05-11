abstract class UpdateProfileState {}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {}

class UpdateProfileErrorState extends UpdateProfileState {
  final String error;

  UpdateProfileErrorState({required this.error});
}
