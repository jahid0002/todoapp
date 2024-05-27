import 'package:todoapp/app/domain/models/task_model.dart';
import 'package:todoapp/app/services/task_service.dart';

class FirebaseDatabase implements TaskService {
  @override
  Future<void> add(TaskModel model) async {}

  @override
  Future<void> delete(TaskModel task) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> update(TaskModel task) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> taskCompleted(TaskModel task, bool isDone) {
    // TODO: implement taskCompleted
    throw UnimplementedError();
  }
}
