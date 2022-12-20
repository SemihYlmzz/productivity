import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../screens/day_screens.dart';

class TrainingGetReady extends StatefulWidget {
  final StringCallback stageIndex;
  final int visibleIndex;
  final String movement;
  final String needs;
  final int repGoal;
  final int setGoal;

  const TrainingGetReady(
      {Key? key,
      required this.stageIndex,
      required this.visibleIndex,
      required this.movement,
      required this.needs,
      required this.repGoal,
      required this.setGoal})
      : super(key: key);

  @override
  State<TrainingGetReady> createState() => _TrainingGetReadyState();
}

class _TrainingGetReadyState extends State<TrainingGetReady> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visibleIndex == 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          FadeIn(
            delay: const Duration(milliseconds: 600),
            child: const Text(
              'Get Ready',
              style: TextStyle(fontSize: 70),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeInLeft(
                  delay: const Duration(milliseconds: 1000),
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.greenAccent,
                            Colors.greenAccent,
                            Colors.tealAccent,
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.tealAccent,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          widget.movement,
                          style: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 4),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInRight(
                    delay: const Duration(milliseconds: 1400),
                    child: Text(widget.needs)),
              ],
            ),
          ),
          FadeIn(
              delay: const Duration(milliseconds: 2200),
              child: Text(
                widget.movement != '  Plank'
                    ? 'You will go for ${widget.repGoal} Reps. ${widget.setGoal} Sets.'
                    : 'You will go for ${widget.repGoal} seconds. 3 Sets.',
                textAlign: TextAlign.start,
              )),
          FadeIn(
            delay: const Duration(milliseconds: 2500),
            child: CupertinoButton(
              child: const Text(
                'Start',
                style: TextStyle(shadows: []),
              ),
              onPressed: () {
                widget.stageIndex(1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
