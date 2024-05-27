import 'package:dartz/dartz.dart';
import 'package:todoapp/app/domain/error/failures.dart';
import 'package:todoapp/app/domain/models/task_model.dart';

abstract class NewTaskService {
  Future<void> add(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> getAll();
  Future<void> delete(TaskModel task);
  Future<void> update(TaskModel task);
  Future<void> taskCompleted(TaskModel task, bool isDone);
}
