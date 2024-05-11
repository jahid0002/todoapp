import 'package:flutter/material.dart';

import 'package:todoapp/app/routes/app_routes.dart';
import 'package:todoapp/app/services/shared_prefarence.dart';
import 'package:todoapp/app/services/task_service.dart';
import 'package:todoapp/app/utils/color.dart';
import 'package:todoapp/app/utils/text_theme.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.I.registerSingleton<TaskService>(StoreData());

  runApp(const MyApp());
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
