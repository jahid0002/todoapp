import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/bloc/home_bloc/home_bloc.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/global_widgets/global_cart.dart';
import 'package:todoapp/app/global_widgets/global_textfield.dart';
import 'package:todoapp/app/views/add_edit_page/edit_page.dart';

import '../../domain/models/task_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
//  bool? isData;
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(HomeGetAllDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const GlobalAppbar(
        title: 'Search Task',
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GlobalTextFormField(
                autofocus: true,
                onChanged: (p0) {
                  setState(() {});
                },
                icon: Icons.search,
                controller: searchController,
                hintText: 'Search Your Task'),
            SizedBox(
              height: size.width * 0.02,
            ),
            Expanded(child:
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return switch (state) {
                HomeInitialState() => Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).cardColor,
                  )),
                ErrorState() => Center(
                      child: Text(
                    state.errorMessage.toString(),
                    style: TextStyle(
                        color: Theme.of(context).cardColor, fontSize: 25),
                  )),
                LoadState() => state.taskList.isEmpty
                    ? _isEmptyState()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.taskList.length,
                        itemBuilder: (context, index) {
                          TaskModel task = state.taskList[index];
                          if (searchController.text.isNotEmpty) {
                            if (state.taskList[index].task
                                .toLowerCase()
                                .contains(searchController.text
                                    .toString()
                                    .toLowerCase())) {
                              return _searchPageState(state.taskList[index]);
                            } else {
                              return Container();
                            }
                          }

                          return _searchPageState(task);
                        }),
              };
              // if (snapshot.hasError) {
              //   return
              // } else if (snapshot.hasData) {
              //   if (snapshot.data!.isEmpty) {
              //     return _isEmptyState();
              //   }
              //   return ListView.builder(
              //       shrinkWrap: true,
              //       physics: const BouncingScrollPhysics(),
              //       itemCount: snapshot.data!.length,
              //       itemBuilder: (context, index) {
              //         TaskModel task = snapshot.data![index];
              //         if (searchController.text.isNotEmpty) {
              //           if (snapshot.data![index].task
              //               .toLowerCase()
              //               .contains(searchController.text
              //                   .toString()
              //                   .toLowerCase())) {
              //             return _searchPageState(
              //                 snapshot.data![index]);
              //           } else {
              //             return Container();
              //           }
              //         }

              //         return _searchPageState(task);
              //       });
              // } else {
              //   return _isEmptyState();
              // }
            })),
          ],
        ),
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

  _searchPageState(TaskModel task) {
    return GlobalCart(
        date: task.date,
        time: task.time,
        isDone: task.isDone,
        title: task.task,
        isDonebutton: () {
          context
              .read<HomeBloc>()
              .add(IsDoneEvent(task: task, isDone: !task.isDone));
          // service.taskCompleted(task, !task.isDone).then(
          //   (value) {
          //     setState(() {});
          //   },
          // );
        },
        onPress: () async {
          String? update = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => EditPage(task: task)));
          if (update == 'update' || update == null) {
            setState(() {});
          }
        },
        discription: task.discription);
  }
}
