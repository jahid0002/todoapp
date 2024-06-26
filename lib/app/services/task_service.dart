import 'package:todoapp/app/domain/models/task_model.dart';

abstract class TaskService {
  Future<void> add(TaskModel task);
  Future<List<TaskModel>> getAll();
  Future<void> delete(TaskModel task);
  Future<void> update(TaskModel task);
  Future<void> taskCompleted(TaskModel task, bool isDone);
}
