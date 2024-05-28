import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import 'package:todoapp/app/infrastructure/data_sources/theme_source.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ThemeSource theme = ThemeSource();
  SettingsBloc() : super(SettingsInitial()) {
    on<SetTheme>(_setTheme);
    on<GetTheme>(_getThem);
    on<UpdateTheme>(_updateTheme);
  }

  FutureOr<void> _setTheme(SetTheme event, Emitter<SettingsState> emit) async {
    var response = await theme.setTheme();
    response.fold((left) {
      emit(SettingErrorState(error: left.message));
    }, (right) async {
      if (kDebugMode) {
        print(right);
      }
    });
  }

  FutureOr<void> _getThem(GetTheme event, Emitter<SettingsState> emit) async {
    var response = await theme.getTheme();

    response.fold((left) {
      emit(SettingErrorState(
        error: left.message,
      ));
    }, (right) {
      // print("right $right");
      emit(SettingsGetDataState(
        isDark: right,
      ));
    });
  }

  FutureOr<void> _updateTheme(
      UpdateTheme event, Emitter<SettingsState> emit) async {
    var response = await theme.updateTheme(isdark: event.isDark);
    response.fold((left) {
      emit(SettingErrorState(
        error: left.message,
      ));
    }, (right) async {
      if (kDebugMode) {
        print(right);
      }
    });
  }
}
