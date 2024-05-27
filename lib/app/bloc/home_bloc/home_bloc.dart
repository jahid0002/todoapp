// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:todoapp/app/domain/error/failures.dart';
import 'package:todoapp/app/domain/models/task_model.dart';
import 'package:todoapp/app/domain/repositories/task_services.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewTaskService service = GetIt.I();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetAllDataEvent>(_homeGetAllDataEvent);

    on<TaskAddEvent>(_taskAddEvent);
    on<TaskEditEvent>(_taskEditEvent);
    on<IsDoneEvent>(_isDoneEvent);
    on<DeleteEvent>(_deleteEvent);
  }

  FutureOr<void> _homeGetAllDataEvent(
      HomeGetAllDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitialState());
    var response = await service.getAll();

    response.fold(
      (left) {
        emit(ErrorState(left.message));
      },
      (right) {
        if (kDebugMode) {
          print(right.length);
        }
        emit(LoadState(taskList: right));
      },
    );
  }

  Future<void> _taskAddEvent(
      TaskAddEvent event, Emitter<HomeState> emit) async {
    await service.add(event.task);

    var response = await service.getAll();

    response.fold((left) {
      emit(ErrorState(const DatabaseFailure().message));
    }, (right) {
      if (kDebugMode) {
        print(right.length);
      }
      emit(LoadState(taskList: List.from(right)));
    });
  }

  FutureOr<void> _taskEditEvent(
      TaskEditEvent event, Emitter<HomeState> emit) async {
    await service.update(event.task);

    var response = await service.getAll();

    response.fold((left) {
      emit(ErrorState(const DatabaseFailure().message));
    }, (right) {
      if (kDebugMode) {
        print(right.length);
      }
      emit(LoadState(taskList: List.from(right)));
    });
  }

  FutureOr<void> _isDoneEvent(
      IsDoneEvent event, Emitter<HomeState> emit) async {
    await service.taskCompleted(event.task, event.isDone);

    var response = await service.getAll();

    response.fold((left) {
      emit(ErrorState(left.message));
    }, (right) {
      if (kDebugMode) {
        print(right.length);
      }
      emit(LoadState(taskList: right));
    });
  }

  FutureOr<void> _deleteEvent(
      DeleteEvent event, Emitter<HomeState> emit) async {
    await service.delete(event.task);

    var response = await service.getAll();

    response.fold((left) {
      emit(ErrorState(left.message));
    }, (right) {
      if (kDebugMode) {
        print(right.length);
      }
      emit(LoadState(taskList: right));
    });
  }
}
