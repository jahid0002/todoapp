import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/bloc/home_bloc/home_bloc.dart';
import 'package:todoapp/app/bloc/settings_bloc/bloc/settings_bloc.dart';
import 'package:todoapp/app/domain/repositories/task_services.dart';
import 'package:todoapp/app/infrastructure/data_sources/task_source.dart';

import 'package:todoapp/app/routes/app_routes.dart';
import 'package:get_it/get_it.dart';
import 'package:todoapp/app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<NewTaskService>(TaskSource());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => SettingsBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        bool isDark = state is SettingsGetDataState ? state.isDark : false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Todo App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/',
          routes: AppRoute.routes,
        );
      },
    );
  }
}
