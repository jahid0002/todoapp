import 'package:flutter/material.dart';

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
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1,
                    color: Theme.of(context).cardColor.withOpacity(.5))),
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
                                  color: Theme.of(context).cardColor,
                                )
                              : Icon(
                                  Icons.radio_button_unchecked_outlined,
                                  size: 30,
                                  color: Theme.of(context).cardColor,
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
                                color: Theme.of(context).cardColor,
                                decoration:
                                    isDone ? TextDecoration.lineThrough : null),
                      ),
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      width: size.width * 0.09,
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
                                                color: Theme.of(context)
                                                    .cardColor))
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
                                        .copyWith(
                                            color: Theme.of(context).cardColor),
                                  )
                                : const SizedBox(),
                            date != null
                                ? Text(date!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Theme.of(context).cardColor))
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
