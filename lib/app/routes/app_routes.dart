import 'package:flutter/material.dart';
import 'package:todoapp/app/views/add_edit_page/add_page.dart';
import 'package:todoapp/app/views/home_page/home_page.dart';
import 'package:todoapp/app/views/search_page/search_page.dart';
import 'package:todoapp/app/views/settings/setting_page.dart';
import 'package:todoapp/app/views/spalsh_page/spalash_page.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SpalashPage(),
    '/homePage': (context) => const HomePage(),
    '/addPage': (context) => const AddPage(),
    '/searchPage': (context) => const SearchPage(),
    PageName.settingPage: (context) => const SettingsPage(),
  };
}

class PageName {
  static String homePage = '/homePage';
  static String settingPage = '/setingPage';
}
