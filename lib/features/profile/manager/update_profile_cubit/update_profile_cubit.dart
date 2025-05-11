import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/profile/manager/update_profile_cubit/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();

  UpdateProfileCubit() : super(UpdateProfileInitialState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  void onUpdateButtonPressed() {
    if (!formKey.currentState!.validate()) {
      emit(UpdateProfileLoadingState());
      return emit(UpdateProfileErrorState(error: 'error'));
    }

    emit(UpdateProfileSuccessState());
  }
}
