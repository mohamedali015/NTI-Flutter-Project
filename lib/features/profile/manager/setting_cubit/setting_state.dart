abstract class SettingState {}

class SettingInitialState extends SettingState {}

class SettingLoadingState extends SettingState {}

class SettingSuccessState extends SettingState {}

class SettingErrorState extends SettingState {
  final String error;

  SettingErrorState({required this.error});
}

class SettingChangeLanguageState extends SettingState {}

class SettingChangeThemeState extends SettingState {}
