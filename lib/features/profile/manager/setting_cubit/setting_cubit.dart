import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/profile/manager/setting_cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  late bool selected = false;

  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  void changeLanguageOnPressed() {
    selected = !selected;
    emit(SettingChangeLanguageState());
  }
}
