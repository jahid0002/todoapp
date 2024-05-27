import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/app/domain/models/task_model.dart';
import 'package:todoapp/app/services/task_service.dart';

class StoreData implements TaskService {
  static const key = 'keyTask';

  @override
  Future<void> add(TaskModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasks = await getAll();

    // tasks.sort((a, b) => (b.id ?? 0) - (a.id ?? 0));
    int maxId = 0;
    if (tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        if (maxId < tasks[i].id!) {
          maxId = tasks[i].id!;
        }
      }
    }

    //  var maxId = tasks.lastOrNull?.id ?? 0;
    task.id = maxId + 1;
    tasks.add(task);

    prefs.setString(
        key,
        jsonEncode(List<dynamic>.from(tasks.map(
          (e) => e.toMap(),
        ))));
  }

  @override
  Future<List<TaskModel>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var str = prefs.getString(key);

    return str == null
        ? []
        : (jsonDecode(str) as List)
            .map(
              (e) => TaskModel.fromMap(e),
            )
            .toList();
  }

  @override
  Future<void> delete(TaskModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasks = await getAll();

    tasks.removeWhere((data) => data.id == task.id);

    await prefs.setString(
        key,
        jsonEncode(List<dynamic>.from((tasks.map(
          (e) => e.toMap(),
        )))));
  }

  @override
  Future<void> update(TaskModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasks = await getAll();

    int index = tasks.indexWhere((data) => data.id == task.id);

    tasks[index] = task;

    await prefs.setString(
        key,
        jsonEncode(List<dynamic>.from((tasks.map(
          (e) => e.toMap(),
        )))));
  }

  @override
  Future<void> taskCompleted(TaskModel task, bool isDone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasks = await getAll();

    int index = tasks.indexWhere((data) => data.id == task.id);

    tasks[index].isDone = isDone;

    await prefs.setString(
        key,
        jsonEncode(List<dynamic>.from((tasks.map(
          (e) => e.toMap(),
        )))));
  }
}
