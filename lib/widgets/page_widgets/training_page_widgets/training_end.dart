import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef MapCallback = void Function(Map<String, dynamic>);
typedef BoolCallback = void Function(bool);

class TrainingEnd extends StatefulWidget {
  const TrainingEnd({
    required this.visibleIndex,
    required this.movement,
    required this.repsList,
    required this.repGoal,
    required this.finishedExercise,
    required this.isDoneInfo,
    super.key,
  });
  final MapCallback? finishedExercise;
  final BoolCallback isDoneInfo;
  final int visibleIndex;
  final String movement;
  final List<int> repsList;
  final int repGoal;

  @override
  State<TrainingEnd> createState() => _TrainingEndState();
}

class _TrainingEndState extends State<TrainingEnd> {
  int? abc;

  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    if (abc == null) {
      for (var i = 0; i < widget.repsList.length; i++) {
        abc != null
            ? abc = abc! + widget.repsList[i]
            : abc = widget.repsList[i];
      }
    }
    return Visibility(
      visible: widget.visibleIndex == 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showDetails = !showDetails;
              });
            },
            child: Column(
              children: [
                Text(widget.movement),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: !showDetails
                      ? 120
                      : (widget.movement != '  Plank')
                          ? 260
                          : 200,
                  width: 325,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withOpacity(0.3),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white10,
                        blurRadius: 50,
                      ),
                    ],
                  ),
                  child: !showDetails
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Rep/Sec'),
                                Text(abc.toString()),
                              ],
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Rest'),
                                Text('16m 23s'),
                              ],
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Dif'),
                                Text('0 Kg'),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            tableLine('', 'Exp.', 'You', 'Rest'),
                            tableLine(
                              'Set 1 -',
                              widget.repGoal.toString(),
                              widget.repsList[0].toString(),
                              '3m 25s',
                            ),
                            tableLine(
                              'Set 2 -',
                              widget.repGoal.toString(),
                              widget.repsList[1].toString(),
                              '1m 55s',
                            ),
                            tableLine(
                              'Set 3 -',
                              widget.repGoal.toString(),
                              widget.repsList[2].toString(),
                              widget.movement == '  Plank' ? '' : '2m 44s',
                            ),
                            if (widget.movement != '  Plank')
                              tableLine(
                                'Set 4 -',
                                widget.repGoal.toString(),
                                widget.repsList[3].toString(),
                                '4m 28s',
                              ),
                            if (widget.movement != '  Plank')
                              tableLine(
                                'Set 5 -',
                                widget.repGoal.toString(),
                                widget.repsList[4].toString(),
                                '',
                              ),
                          ],
                        ),
                )
              ],
            ),
          ),
          if (widget.repsList.length > 4 ||
              (widget.movement == '  Plank' && widget.repsList.length == 3))
            showDetails
                ? const Text('Tap Box to Close Details.')
                : const Text('Tap Box to See Details.'),
          FadeIn(
            delay: const Duration(milliseconds: 2500),
            child: CupertinoButton(
              child: const Text(
                'Done',
                style: TextStyle(shadows: []),
              ),
              onPressed: () {
                widget.finishedExercise!({
                  'exercise': widget.movement,
                  'Reps': abc,
                  'Rest': 4500,
                  'Set-1': widget.repsList[0],
                  'Set-2': widget.repsList[1],
                  'Set-3': widget.repsList[2]
                });
                widget.isDoneInfo(true);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Flexible tableLine(
    String column1,
    String column2,
    String column3,
    String column4,
  ) {
    return Flexible(
      child: Row(
        children: [
          Expanded(child: Center(child: Text(column1))),
          Expanded(child: Center(child: Text(column2))),
          Expanded(child: Center(child: Text(column3))),
          Expanded(child: Center(child: Text(column4))),
        ],
      ),
    );
  }
}
