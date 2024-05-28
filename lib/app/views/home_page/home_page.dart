import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:todoapp/app/bloc/home_bloc/home_bloc.dart';
import 'package:todoapp/app/bloc/settings_bloc/bloc/settings_bloc.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/global_widgets/global_cart.dart';
import 'package:todoapp/app/global_widgets/global_floating_button.dart';
import 'package:todoapp/app/global_widgets/global_logo.dart';
import 'package:todoapp/app/domain/models/task_model.dart';
import 'package:todoapp/app/routes/app_routes.dart';
import 'package:todoapp/app/utils/app_extension.dart';
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

  // final TaskService service = GetIt.I();
  List<TaskModel>? taskList;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeGetAllDataEvent());
    context.read<SettingsBloc>().add(SetTheme());
    context.read<SettingsBloc>().add(GetTheme());
  }

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
        settingButton: () {
          Navigator.pushNamed(context, PageName.settingPage);
        },
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.13,
        width: size.height * 0.09,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalFButton(
              icon: Icons.add,
              onTap: () async {
                String? update = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddPage()));
                if (update == 'update' || update == null) {
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return switch (state) {
                  HomeInitialState() =>
                    const Center(child: CircularProgressIndicator()),
                  ErrorState _ => Center(
                        child: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    )),
                  LoadState() => state.taskList.isEmpty
                      ? _isEmptyState()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.taskList.length,
                          itemBuilder: (context, index) {
                            int reverseIndex =
                                state.taskList.length - 1 - index;

                            TaskModel task = state.taskList[reverseIndex];

                            return _isNotEmptyState(task);
                          }),
                };

                //  return FutureBuilder(
                //      future: service.getAll(),
                //     builder: (context, snapshot) {
                //     if (snapshot.hasError) {
                //      return Center(
                //          child: Text(
                //       snapshot.error.toString(),
                //       style: const TextStyle(
                //           color: Colors.black, fontSize: 25),
                //     ));
                //   } else if (snapshot.hasData) {
                //     if (snapshot.data!.isEmpty) {
                //       return _isEmptyState();
                //      }
                //     return ListView.builder(
                //         shrinkWrap: true,
                //       physics: const BouncingScrollPhysics(),
                //      itemCount: snapshot.data!.length,
                //     itemBuilder: (context, index) {
                //      int reverseIndex =
                //           snapshot.data!.length - 1 - index;
//                      TaskModel task = snapshot.data![reverseIndex];

                //            return _isNotEmptyState(task);
                //           });
                //     } else {
                //        return _isEmptyState();
                //      }
                //    });
              })),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlobalTextFormField(
                        onChanged: (p0) {
                          setState(() {});
                        },
                        controller: homeCotroller,
                        hintText: 'Enter Quick Task Here',
                        keyboardType: TextInputType.text),
                  )),
                  homeCotroller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            //  service.add(TaskModel(
                            TaskModel task = TaskModel(
                                task: homeCotroller.text.toString(),
                                isDone: false);
                            //  isDone: false));
                            //  context.read<HomeBloc>().add(HomeGetAllDataEvent());
                            context
                                .read<HomeBloc>()
                                .add(TaskAddEvent(task: task));
                            // context.read<HomeBloc>().add(HomeGetAllDataEvent());
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
          )),
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
              //  await service.delete(task);
              // ignore: use_build_context_synchronously
              context.read<HomeBloc>().add(DeleteEvent(task: task));
              setState(() {});
            },
            color: AppColor.whiteColor),
      ],
      child: GlobalCart(
        date: task.date,
        time: task.time,
        isDone: task.isDone,
        title: task.task.toTileUperCase(),
        isDonebutton: () {
          context
              .read<HomeBloc>()
              .add(IsDoneEvent(task: task, isDone: task.isDone ? false : true));

          //  service.taskCompleted(task, !task.isDone).then(
          //   (value) {
          //
          // },
          //   );
          setState(() {});
        },
        onPress: () async {
          String? update = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => EditPage(task: task)));
          if (update == 'update' || update == null) {
            setState(() {});
          }
        },
        discription: task.discription == null
            ? task.discription
            : task.discription!.toTileUperCase(),
      ),
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
