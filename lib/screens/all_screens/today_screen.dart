import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/screen_widgets/today_widgets/inboxes/inboxes_exports.dart';
import '../../widgets/screen_widgets/today_widgets/jobs_box_widget.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen>
    with AutomaticKeepAliveClientMixin<TodayScreen> {
  String date = '';
  String sleptAt = '20:42';
  String wakeUpAt = '04:42';
  String dayOfTheWeek = 'Pazartesi';

  List<Map<String, dynamic>> houseMap = [
    {'mission': 'Make Your Bed.', 'isDone': false},
    {'mission': "Place everything, Where they must be", 'isDone': false},
    {'mission': 'Clean your Room', 'isDone': false},
    {'mission': 'Place the Dishes.', 'isDone': false},
  ];
  List<Map<String, dynamic>> bodyMap = [
    {'mission': 'Tooth Brush.', 'isDone': false},
    {'mission': 'Nails', 'isDone': false},
    {'mission': 'Beard', 'isDone': false},
    {'mission': 'Shave', 'isDone': false},
    {'mission': 'Shower', 'isDone': false},
  ];
  List<Map<String, dynamic>> unfinishedExercises = [
    /*{'exercise': 'Pull-Up', 'rep': 11, 'dif': '-40','isDone':false,'needs':'- Pull-Up Bar\n- (K) Res. Band'},
    {'exercise': '  Curl', 'rep': 7, 'dif': '+12','isDone':false,'needs' :'- 12Kg Dumbbell'},*/
    /*{'exercise': 'Push-Up', 'rep': 11, 'dif': '-40','isDone':false,'needs':'- Push-Up Bar'},
    {'exercise': '  Press', 'rep': 7, 'dif': '+12','isDone':false,'needs' :'- 12Kg Dumbbell'},*/
    {
      'exercise': '  Plank',
      'rep': 121,
      'dif': '10',
      'isDone': false,
      'needs': '- None'
    },
  ];
  List<Map<String, dynamic>> finishedExercises = [];

  int currentToDoIndex = 0;
  int segmentedIndex = 0;

  List<IconData> todoBoxUnselected = [
    CupertinoIcons.moon_stars,
    CupertinoIcons.rectangle_badge_checkmark,
    CupertinoIcons.rectangle_split_3x3,
    CupertinoIcons.rectangle_stack_person_crop,
    Icons.fastfood_outlined,
    Icons.water_drop_outlined,
  ];
  List<IconData> todoBoxSelected = [
    CupertinoIcons.moon_stars_fill,
    CupertinoIcons.rectangle_fill_badge_checkmark,
    CupertinoIcons.rectangle_split_3x3_fill,
    CupertinoIcons.rectangle_stack_person_crop_fill,
    Icons.fastfood,
    Icons.water_drop,
  ];

  @override
  void initState() {
    date =
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          date,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white.withOpacity(0.035),
        brightness: Brightness.dark,
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding:
                  EdgeInsets.only(top: 70 + MediaQuery.of(context).padding.top),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) => Center(
                child: GestureDetector(
                  onTap: () {
                    if (currentToDoIndex != 1 && index == 1) {
                      segmentedIndex = 0;
                    }
                    currentToDoIndex = index;
                    setState(() {});
                  },
                  child: JobsBox(
                    width: currentToDoIndex == index ? 110 : 100,
                    height: currentToDoIndex == index ? 110 : 100,
                    color: currentToDoIndex == index
                        ? Colors.greenAccent
                        : Colors.white24,
                    iconData: currentToDoIndex == index
                        ? todoBoxSelected.elementAt(index)
                        : todoBoxUnselected.elementAt(index),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 365,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SleepInbox(
                        currentToDoIndex: currentToDoIndex,
                        sleptAt: sleptAt,
                        wakeUpAt: wakeUpAt),
                    ToDoInbox(
                      currentToDoIndex: currentToDoIndex,
                      houseMap: houseMap,
                      bodyMap: bodyMap,
                      segmentedIndex: segmentedIndex,
                      changeSegmentedIndex: (val) {
                        setState(() {
                          segmentedIndex = val;
                        });
                      },
                    ),
                    SportInbox(
                      is2ExerciseToday: unfinishedExercises.length == 2,
                      currentToDoIndex: currentToDoIndex,
                      dayOfTheWeek: dayOfTheWeek,
                      todaysExercises: unfinishedExercises,
                      isAllExercisesEnd: finishedExercises.length ==
                          unfinishedExercises.length,
                      finishedExercise: (v) {
                        finishedExercises.add(v);
                        setState(() {});
                      },
                      isDoneInfo: (v) {
                        if (unfinishedExercises[0]['isDone'] != true) {
                          unfinishedExercises[0]['isDone'] = v;
                        } else {
                          unfinishedExercises[1]['isDone'] = v;
                        }
                        setState(() {});
                      },
                    ),
                    LanguageInbox(currentToDoIndex: currentToDoIndex),
                    DietInbox(currentToDoIndex: currentToDoIndex),
                    WaterInbox(currentToDoIndex: currentToDoIndex),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
