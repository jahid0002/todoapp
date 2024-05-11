import 'package:flutter/material.dart';

import 'package:todoapp/app/utils/color.dart';

class DeleteDialog {
  Future<void> deleteDialog(
    BuildContext context,
  ) async {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'Delete item',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColor.textColor),
              ),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel',
                        style: Theme.of(context).textTheme.displaySmall)),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Delete',
                        style: Theme.of(context).textTheme.displaySmall)),
              ],
            ));
  }
}
