import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/global_widgets/global_floating_button.dart';
import 'package:todoapp/app/global_widgets/global_textfield.dart';
import 'package:todoapp/app/models/task_model.dart';
import 'package:todoapp/app/services/date_picker.dart';
import 'package:todoapp/app/services/task_service.dart';
import 'package:todoapp/app/services/time_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TaskService service = GetIt.I();

  final taskController = TextEditingController();
  final disController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const GlobalAppbar(
        title: 'New Task',
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GlobalTextFormField(
                autofocus: true,
                controller: taskController,
                hintText: 'Enter Task here',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Task can not be empty';
                  }
                  return null;
                },
              ),
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
        ),
      ),
      floatingActionButton: GlobalFButton(
        icon: Icons.check,
        onTap: () async {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          if (disController.text.isEmpty &&
              timeController.text.isEmpty &&
              dateController.text.isEmpty) {
            TaskModel task =
                TaskModel(task: taskController.text.toString(), isDone: false);

            await service.add(task);

            if (context.mounted) {
              Navigator.pop(context, 'update');
            }
          } else {
            TaskModel task = TaskModel(
                task: taskController.text.toString(),
                isDone: false,
                discription: disController.text.toString(),
                time: timeController.text.toString(),
                date: dateController.text.toString());

            await service.add(task);

            if (context.mounted) {
              Navigator.pop(context, 'update');
            }
          }
        },
      ),
    );
  }
}
