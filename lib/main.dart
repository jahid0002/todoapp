import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/bloc/home_bloc/home_bloc.dart';
import 'package:todoapp/app/domain/repositories/task_services.dart';
import 'package:todoapp/app/infrastructure/data_sources/task_source.dart';

import 'package:todoapp/app/routes/app_routes.dart';
import 'package:todoapp/app/utils/color.dart';
import 'package:todoapp/app/utils/text_theme.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<NewTaskService>(TaskSource());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor:
        textTheme: AppTextTheme.textTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.whiteColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: AppRoute.routes,
    );
  }
}
