import 'package:flutter/material.dart';
import 'package:todoapp/app/utils/color.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {super.key, required this.buttonName, required this.onTap});

  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        height: size.height * 0.09,
        width: size.width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColor.textColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
