import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '/../../screens/all_pages/today_training_page.dart';

import '../../../../utils/utils.dart';
import '../sport_widgets/data_table_widget.dart';

typedef ListCallback = void Function(Map<String, dynamic>);
typedef BoolCallback = void Function(bool);

class SportInbox extends StatelessWidget {
  const SportInbox({
    required this.currentToDoIndex,
    required this.dayOfTheWeek,
    required this.todaysExercises,
    required this.finishedExercise,
    required this.isAllExercisesEnd,
    required this.isDoneInfo,
    required this.is2ExerciseToday,
    super.key,
  });
  final BoolCallback isDoneInfo;
  final ListCallback? finishedExercise;
  final int currentToDoIndex;
  final String dayOfTheWeek;
  final List<Map<String, dynamic>> todaysExercises;
  final bool isAllExercisesEnd;
  final bool is2ExerciseToday;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentToDoIndex == 2,
      child: FadeInUp(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (!isAllExercisesEnd)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute(
                      TodayTrainingPage(
                        exercise:
                            (!(todaysExercises.elementAt(0)['isDone'] as bool))
                                ? todaysExercises.elementAt(0)
                                : todaysExercises.elementAt(1),
                        dayOfTheWeek: dayOfTheWeek,
                        finishedExerciseTTP: (v) {
                          finishedExercise!(v);
                        },
                        isDoneInfo: isDoneInfo,
                      ),
                    ),
                  );
                },
                child: DataTableWidget(
                  exercise1: todaysExercises.elementAt(0)['exercise'] as String,
                  exercise2: is2ExerciseToday
                      ? todaysExercises.elementAt(1)['exercise'] as String
                      : null,
                  exercise1Reps:
                      todaysExercises.elementAt(0)['exercise'] == '  Plank'
                          ? '${todaysExercises.elementAt(0)['rep']} Sec'
                          : '${todaysExercises.elementAt(0)['rep']}',
                  exercise2Reps: is2ExerciseToday
                      ? '${todaysExercises.elementAt(1)['rep']}'
                      : null,
                  exercise1Set:
                      todaysExercises.elementAt(0)['exercise'] == '  Plank'
                          ? '3'
                          : '5',
                  exercise2Set: is2ExerciseToday ? '5' : null,
                  exercise1Dif: todaysExercises.elementAt(0)['dif'] as String,
                  exercise2Dif: is2ExerciseToday
                      ? todaysExercises.elementAt(1)['dif'] as String
                      : null,
                  exercise1Done: todaysExercises.elementAt(0)['isDone'] as bool,
                  exercise2Done: is2ExerciseToday
                      ? todaysExercises.elementAt(1)['isDone'] as bool
                      : true,
                ),
              )
            else
              Container(),
            if (!isAllExercisesEnd)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tap to Start '),
                  Text(
                    todaysExercises.elementAt(0)['isDone'] == false
                        ? todaysExercises.elementAt(0)['exercise'] as String
                        : todaysExercises.elementAt(1)['exercise'] as String,
                    style: const TextStyle(color: Colors.greenAccent),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
