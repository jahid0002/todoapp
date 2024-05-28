import 'package:flutter/material.dart';

class GlobalSettingsTile extends StatelessWidget {
  const GlobalSettingsTile(
      {super.key, required this.icon, required this.title, this.traling});

  final IconData icon;
  final String title;
  final Widget? traling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      leading: Icon(
        icon,
        size: 30,
        color: Theme.of(context).cardColor,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).cardColor),
      ),
      trailing: traling,
    );
  }
}
