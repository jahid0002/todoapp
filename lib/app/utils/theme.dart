import 'package:flutter/material.dart';
import 'package:todoapp/app/utils/color.dart';
import 'package:todoapp/app/utils/text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.whiteColor,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.whiteColor),
    useMaterial3: true,
    primaryColor: AppColor.backgroundColor,
    hintColor: AppColor.whiteColor,
    focusColor: AppColor.blackColor.withOpacity(.2),
    cardColor: AppColor.blackColor,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.blackColor.withOpacity(.5),
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.whiteColor),
    //  useMaterial3: true,
    primaryColor: AppColor.backgroundColor,
    hintColor: AppColor.blackColor,
    focusColor: AppColor.whiteColor.withOpacity(.1),
    cardColor: AppColor.whiteColor,
  );

  // static ThemeData getTheme(UiMode uiMode) {
  //   switch (uiMode) {
  //     case UiMode.light:
  //       return lightTheme;
  //     case UiMode.dark:
  //       return darkTheme;
  //     case UiMode.system:
  //       return uiMode == UiMode.light ? lightTheme : darkTheme;
  //   }
  // }
}
