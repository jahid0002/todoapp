import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get_it/get_it.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/global_widgets/global_cart.dart';
import 'package:todoapp/app/global_widgets/global_floating_button.dart';
import 'package:todoapp/app/global_widgets/global_logo.dart';
import 'package:todoapp/app/models/task_model.dart';
import 'package:todoapp/app/services/task_service.dart';
import 'package:todoapp/app/views/add_edit_page/add_page.dart';
import 'package:todoapp/app/views/add_edit_page/edit_page.dart';

import '../../global_widgets/global_textfield.dart';
import '../../utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCotroller = TextEditingController();

  final TaskService service = GetIt.I();
  List<TaskModel>? taskList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppbar(
        searchButton: () {
          Navigator.pushNamed(context, '/searchPage');
        },
        title: 'All Task',
        leading: const GlobalLogo(radias: 10),
      ),
      floatingActionButton: homeCotroller.text.isEmpty
          ? SizedBox(
              height: size.height * 0.13,
              width: size.height * 0.09,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalFButton(
                    icon: Icons.add,
                    onTap: () async {
                      String? update = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPage()));
                      if (update == 'update' || update == null) {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox()
                ],
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                  future: service.getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25),
                      ));
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return _isEmptyState();
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            int reverseIndex =
                                snapshot.data!.length - 1 - index;
                            TaskModel task = snapshot.data![reverseIndex];

                            return _isNotEmptyState(task);
                          });
                    } else {
                      return _isEmptyState();
                    }
                  }),
            ),
            Row(
              children: [
                Expanded(
                    child: GlobalTextFormField(
                        onChanged: (p0) {
                          setState(() {});
                        },
                        controller: homeCotroller,
                        hintText: 'Enter Quick Task Here',
                        keyboardType: TextInputType.text)),
                homeCotroller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          service.add(TaskModel(
                              task: homeCotroller.text.toString(),
                              isDone: false));
                          homeCotroller.clear();
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.check,
                          size: 40,
                          color: AppColor.backgroundColor.withOpacity(.9),
                        ))
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }

  _isNotEmptyState(TaskModel task) {
    return SwipeActionCell(
      key: ObjectKey(task),
      trailingActions: <SwipeAction>[
        SwipeAction(
            icon: Icon(
              Icons.delete,
              size: 38,
              color: AppColor.backgroundColor,
            ),
            onTap: (CompletionHandler handler) async {
              await handler(true);
              await service.delete(task);
              setState(() {});
            },
            color: AppColor.whiteColor),
      ],
      child: GlobalCart(
          date: task.date,
          time: task.time,
          isDone: task.isDone,
          title: task.task,
          isDonebutton: () {
            service.taskCompleted(task, !task.isDone).then(
              (value) {
                setState(() {});
              },
            );
          },
          onPress: () async {
            String? update = await Navigator.push(context,
                MaterialPageRoute(builder: (_) => EditPage(task: task)));
            if (update == 'update' || update == null) {
              setState(() {});
            }
          },
          discription: task.discription),
    );
  }

  _isEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/tree.png',
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        Text(
          'No Task Here',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
