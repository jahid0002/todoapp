import 'package:flutter/material.dart';

import 'package:todoapp/app/utils/color.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppbar(
      {super.key,
      this.title,
      this.leading,
      this.actions,
      this.searchButton,
      this.settingButton});

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? searchButton;
  final VoidCallback? settingButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      // centerTitle: true,
      backgroundColor: AppColor.backgroundColor,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColor.whiteColor, fontWeight: FontWeight.w900),
            )
          : null,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      actions: actions ??
          [
            IconButton(
                onPressed: searchButton,
                icon: Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: AppColor.whiteColor,
                )),
            IconButton(
                onPressed: settingButton,
                icon: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: AppColor.whiteColor,
                )),
          ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 70);
}
