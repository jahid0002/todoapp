import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/app/global_widgets/global_logo.dart';
import 'package:todoapp/app/utils/color.dart';

class SpalashPage extends StatefulWidget {
  const SpalashPage({super.key});

  @override
  State<SpalashPage> createState() => _SpalashPageState();
}

class _SpalashPageState extends State<SpalashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: GlobalLogo(
          radias: 50,
          color: AppColor.backgroundColor,
        ),
      ),
    );
  }
}
