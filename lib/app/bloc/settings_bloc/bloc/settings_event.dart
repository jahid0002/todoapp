part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class GetTheme extends SettingsEvent {}

final class UpdateTheme extends SettingsEvent {
  UpdateTheme({required this.isDark});

  final bool isDark;
}

final class SetTheme extends SettingsEvent {}
