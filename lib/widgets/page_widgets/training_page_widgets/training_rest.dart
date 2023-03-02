import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:lottie/lottie.dart';

import '../../screen_widgets/today_widgets/inboxes/todo_inbox.dart';

class TrainingRest extends StatefulWidget {
  const TrainingRest({
    required this.visibleIndex,
    required this.restIndex,
    required this.stageIndexNext,
    required this.stageIndexBack,
    super.key,
  });
  final int visibleIndex;
  final int restIndex;
  final IntCallback stageIndexBack;
  final IntCallback stageIndexNext;

  @override
  State<TrainingRest> createState() => _TrainingRestState();
}

class _TrainingRestState extends State<TrainingRest> {
  List<int> visibleIndexes = [2, 4, 6, 8];
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibleIndexes.contains(widget.visibleIndex),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          FadeIn(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Rest - ${widget.restIndex}',
              style: const TextStyle(fontSize: 70),
            ),
          ),
          Column(
            children: [
              FadeInLeft(
                delay: const Duration(milliseconds: 700),
                child: const Center(
                  child: Text(
                    'Remaining Rest Time',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 1100),
                child: Center(
                  child: CountdownTimer(
                    onEnd: () {
                      if (widget.visibleIndex == 2) {
                        HapticFeedback.vibrate();
                        Future.delayed(
                          const Duration(seconds: 1),
                          HapticFeedback.vibrate,
                        );
                      }
                    },
                    endWidget: const Text('Done'),
                    endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 300,
                  ),
                ),
              ),
            ],
          ),
          FadeIn(
            delay: const Duration(milliseconds: 1700),
            child: SizedBox(
              height: 125,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.9),
                    Colors.green.withOpacity(0.9)
                  ],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_e96Pi2.json',
                  reverse: true,
                  frameRate: FrameRate(60),
                ),
              ),
            ),
          ),
          FadeIn(
            delay: const Duration(milliseconds: 3250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.stageIndexBack(1);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(shadows: []),
                  ),
                ),
                const SizedBox(),
                CupertinoButton(
                  onPressed: () {
                    widget.stageIndexNext(1);

                    /// set1Rep
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(shadows: []),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
