import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/home/data/model/user_model.dart';
import 'package:flutter_nti_task/features/home/manager/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }
}
