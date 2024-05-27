import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/app/bloc/home_bloc/home_bloc.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/domain/models/task_model.dart';

import '../../global_widgets/global_floating_button.dart';
import '../../global_widgets/global_textfield.dart';
import '../../services/date_picker.dart';
import '../../services/time_picker.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.task});

  final TaskModel task;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //late final TaskModel? taskModel;
  // final TaskService service = GetIt.I();

  DateTime? date;
  TimeOfDay? time;

  final TextEditingController taskController = TextEditingController();
  final TextEditingController disController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskController.text = widget.task.task;
    if (widget.task.discription != null) {
      disController.text = widget.task.discription!;
    }
    if (widget.task.date != null) {
      dateController.text = widget.task.date!;
    }
    if (widget.task.time != null) {
      timeController.text = widget.task.time!;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: const GlobalAppbar(
          title: 'Edit Task',
          actions: [],
        ),
        floatingActionButton: GlobalFButton(
          icon: Icons.check,
          onTap: () async {
            if (taskController.text.isEmpty) {
              const snackBar = SnackBar(
                  content: Text(
                'Enter task at first',
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (disController.text.isEmpty &&
                timeController.text.isEmpty &&
                dateController.text.isEmpty) {
              TaskModel task = TaskModel(
                  task: taskController.text.toString(),
                  isDone: false,
                  id: widget.task.id);

              // await service.update(task);
              context.read<HomeBloc>().add(TaskEditEvent(task: task));

              if (context.mounted) {
                Navigator.pop(context, 'update');
              }
            } else {
              context.read<HomeBloc>().add(TaskEditEvent(
                  task: (TaskModel(
                      id: widget.task.id,
                      task: taskController.text.toString(),
                      isDone: widget.task.isDone,
                      discription: disController.text.toString(),
                      time: timeController.text.toString(),
                      date: dateController.text.toString()))));
              if (context.mounted) {
                Navigator.pop(context, 'update');
              }
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GlobalTextFormField(
                  autofocus: true,
                  controller: taskController,
                  hintText: 'Enter Task here',
                  keyboardType: TextInputType.text),
              SizedBox(
                height: size.width * 0.02,
              ),
              GlobalTextFormField(
                  maxLine: 3,
                  controller: disController,
                  hintText: 'Enter Discription Here',
                  keyboardType: TextInputType.text),
              SizedBox(
                height: size.width * 0.04,
              ),
              GlobalTextFormField(
                controller: dateController,
                hintText: 'Date Not Set ',
                readOnly: true,
                onTap: () async {
                  date = await DatePicker.datePicker(context);

                  if (date != null) {
                    setState(() {
                      dateController.text = DateFormat.yMMMMd().format(date!);
                    });
                  }
                },
                suffixOnTap: () {
                  if (dateController.text.isNotEmpty) {
                    dateController.clear();

                    setState(() {});
                  }
                },
                icon: dateController.text.isEmpty
                    ? Icons.calendar_month
                    : Icons.close,
                onChanged: (p0) async {
                  date = await DatePicker.datePicker(context);

                  if (date != null) {
                    setState(() {
                      dateController.text = DateFormat.yMMMMd().format(date!);
                    });
                  }
                },
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
              GlobalTextFormField(
                suffixOnTap: () {
                  if (timeController.text.isNotEmpty) {
                    timeController.clear();
                    setState(() {});
                  }
                },
                readOnly: true,
                icon: timeController.text.isEmpty ? Icons.watch : Icons.close,
                controller: timeController,
                hintText: 'Time Not Set',
                onTap: () async {
                  time = await TimePicker.timePicker(context);
                  if (time != null) {
                    final now = DateTime.now();
                    final dt = DateTime(
                        now.year, now.month, now.day, time!.hour, time!.minute);

                    setState(() {
                      timeController.text = DateFormat.jm().format(dt);
                    });
                  }
                },
                onChanged: (p0) async {
                  time = await TimePicker.timePicker(context);
                  if (time != null) {
                    final now = DateTime.now();
                    final dt = DateTime(
                        now.year, now.month, now.day, time!.hour, time!.minute);

                    setState(() {
                      timeController.text = DateFormat.jm().format(dt);
                    });
                  }
                },
              )
            ],
          ),
        ));
  }
}
