import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/page_widgets/training_page_widgets/training_get_ready.dart';
import '../../widgets/page_widgets/training_page_widgets/training_rest.dart';
import '../../widgets/page_widgets/training_page_widgets/training_end.dart';
import '../../widgets/page_widgets/training_page_widgets/training_start.dart';

typedef ListCallback = void Function(Map<String,dynamic>);
typedef BoolCallback = void Function(bool);

class TodayTrainingPage extends StatefulWidget {
  final BoolCallback isDoneInfo;

  final ListCallback? finishedExerciseTTP;
  final String dayOfTheWeek;
  final Map<String,dynamic> exercise;

  const TodayTrainingPage(
      {Key? key,
      required this.exercise,
      required this.dayOfTheWeek,
      required this.finishedExerciseTTP,
      required this.isDoneInfo,
      })
      : super(key: key);

  @override
  State<TodayTrainingPage> createState() => _TodayTrainingPageState();
}

class _TodayTrainingPageState extends State<TodayTrainingPage> {
  int stageIndex = 0;
  List<int> reps = [];
  List<String> diffs = [];
  Map<String,dynamic> finishedExercise = {};

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white.withOpacity(0.035),
      navigationBar: CupertinoNavigationBar(
        middle:  Text(
          '${widget.dayOfTheWeek} Exercise ',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white.withOpacity(0.035),
        brightness: Brightness.dark,
      ),
      child: Stack(
        children: [
          TrainingGetReady(
            stageIndex: (e) {
              stageIndex = e;
              setState(() {});
            },
            visibleIndex: stageIndex,
            movement: widget.exercise['exercise'],
            needs: widget.exercise['needs'],
            repGoal: widget.exercise['rep'],
            setGoal: 5,
          ),
          TrainingStart(
            stageIndexBack: (e) {
              stageIndex = stageIndex - e;
              setState(() {});
            },
            stageIndexNext: (e) {
              stageIndex = stageIndex + e;
              setState(() {});
            },
            visibleIndex: stageIndex,
            setDif: (dif) {
              setState(() {
                diffs.add(dif);
              });
            },
            setRep: (rep) {
              setState(
                () {
                  reps.add(rep);
                },
              );
            },
            setIndex: reps.length + 1,
            repGoal: widget.exercise['rep'],
            movement: widget.exercise['exercise'],
          ),
          TrainingRest(
            visibleIndex: stageIndex,
            stageIndexNext: (val) {
              setState(() {
                stageIndex = stageIndex + val;
              });
            },
            stageIndexBack: (val) {
              reps.removeLast();
              diffs.removeLast();
              setState(() {
                stageIndex = stageIndex - val;
              });
            },
            restIndex: reps.length,
          ),
          TrainingEnd(
            visibleIndex: stageIndex,
            movement: widget.exercise['exercise'],
            repsList: reps,
            repGoal: widget.exercise['rep'],
            finishedExercise: (v){
              widget.finishedExerciseTTP!(v);
            },
            isDoneInfo: (v){
              widget.isDoneInfo(v);
            },
          ),
        ],
      ),
    );
  }
}
