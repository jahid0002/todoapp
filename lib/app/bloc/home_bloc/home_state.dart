part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

class LoadState extends HomeState {
  LoadState({required this.taskList});

  final List<TaskModel> taskList;
}

class ErrorState extends HomeState {
  ErrorState(this.errorMessage);
  final String errorMessage;
}
