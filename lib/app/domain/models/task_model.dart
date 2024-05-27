import 'dart:convert';

class TaskModel {
  int? id;
  String task;
  String? discription;
  String? date;
  String? time;
  bool isDone;

  TaskModel(
      {required this.task,
      required this.isDone,
      this.date,
      this.discription,
      this.time,
      this.id});

  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
      task: map['task'],
      isDone: map['isDone'],
      discription: map['discription'],
      date: map['date'],
      time: map['time'],
      id: map['id']);

  factory TaskModel.fromJson(String json) =>
      TaskModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'task': task,
        'discription': discription,
        'date': date,
        'time': time,
        'id': id,
        'isDone': isDone
      };

  String toJson() => jsonEncode(toMap());
}
