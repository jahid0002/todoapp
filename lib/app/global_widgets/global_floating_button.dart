import 'package:flutter/material.dart';
import 'package:todoapp/app/utils/color.dart';

class GlobalFButton extends StatelessWidget {
  const GlobalFButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: FloatingActionButton(
          isExtended: true,
          backgroundColor: AppColor.backgroundColor.withOpacity(.9),
          onPressed: onTap,
          child: Icon(
            icon,
            size: 30,
            color: AppColor.whiteColor,
          )),
    );
  }
}
