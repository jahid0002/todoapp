part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsGetDataState extends SettingsState {
  SettingsGetDataState({required this.isDark});
  final bool isDark;
}

final class SettingErrorState extends SettingsState {
  SettingErrorState({required this.error});
  final String error;
}
