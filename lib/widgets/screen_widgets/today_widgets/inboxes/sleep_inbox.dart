
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class SleepInbox extends StatelessWidget {
  final int currentToDoIndex;
  final String sleptAt;
  final String wakeUpAt;

  const SleepInbox(
      {Key? key,
      required this.currentToDoIndex,
      required this.sleptAt,
      required this.wakeUpAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentToDoIndex == 0,
      child: FadeInLeft(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children:  [
                const Text('You Slept at'),
                GradientText(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.greenAccent,
                      Colors.greenAccent,
                      Colors.green,
                    ],
                  ),
                  sleptAt,
                  style: const TextStyle(fontSize: 55),
                ),
              ],
            ),
            Column(
              children: [
                const Text('You Woke Up at'),
                GradientText(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.greenAccent,
                      Colors.greenAccent,
                      Colors.green,
                    ],
                  ),
                  wakeUpAt,
                  style: const TextStyle(fontSize: 55),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
