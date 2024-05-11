import 'package:flutter/material.dart';
import 'package:todoapp/app/utils/color.dart';

class GlobalCart extends StatelessWidget {
  const GlobalCart({
    super.key,
    required this.isDone,
    required this.title,
    required this.isDonebutton,
    required this.onPress,
    this.discription,
    this.time,
    this.date,
  });

  final bool isDone;
  final String title;
  final VoidCallback isDonebutton;

  final VoidCallback onPress;

  final String? discription;
  final String? time;
  final String? date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            // clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor.withOpacity(.95),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: isDonebutton,
                          child: isDone
                              ? Icon(
                                  Icons.check_outlined,
                                  size: 30,
                                  color: AppColor.whiteColor,
                                )
                              : Icon(
                                  Icons.radio_button_unchecked_outlined,
                                  size: 30,
                                  color: AppColor.whiteColor,
                                )),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: AppColor.whiteColor,
                                decoration:
                                    isDone ? TextDecoration.lineThrough : null),
                      ),
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Expanded(
                        flex: 3,
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                            child: SingleChildScrollView(
                                child: discription != null
                                    ? Text(discription!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                                color: AppColor.whiteColor))
                                    : null))),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            time != null
                                ? Text(
                                    time!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: AppColor.whiteColor),
                                  )
                                : const SizedBox(),
                            date != null
                                ? Text(date!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: AppColor.whiteColor))
                                : const SizedBox()
                          ],
                        ))
                  ])
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.02,
        )
      ],
    );
  }
}
