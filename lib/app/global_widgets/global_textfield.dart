import 'package:flutter/material.dart';
import 'package:todoapp/app/utils/color.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLine = 1,
    this.onChanged,
    this.autofocus,
    this.readOnly,
    this.onTap,
    this.icon,
    this.suffixOnTap,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLine;
  final Function(String)? onChanged;
  final bool? autofocus;
  final bool? readOnly;
  final VoidCallback? onTap;
  final IconData? icon;
  final VoidCallback? suffixOnTap;
  final String? Function(dynamic value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLine,
      validator: validator,
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(color: AppColor.whiteColor),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon != null
            ? InkWell(
                onTap: suffixOnTap,
                child: Icon(
                  icon,
                  size: 30,
                  color: AppColor.whiteColor,
                ))
            : null,
        filled: true,
        fillColor: AppColor.backgroundColor.withOpacity(.9),
        hintStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColor.whiteColor),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColor.whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColor.whiteColor)),
        errorBorder: const OutlineInputBorder(),
      ),
    );
  }
}
