part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeGetAllDataEvent extends HomeEvent {}

class TaskAddEvent extends HomeEvent {
  TaskAddEvent({required this.task});

  final TaskModel task;
}

class TaskEditEvent extends HomeEvent {
  TaskEditEvent({required this.task});

  final TaskModel task;
}

class IsDoneEvent extends HomeEvent {
  IsDoneEvent({required this.task, required this.isDone});

  final TaskModel task;
  final bool isDone;
}

final class DeleteEvent extends HomeEvent {
  DeleteEvent({required this.task});

  final TaskModel task;
}
