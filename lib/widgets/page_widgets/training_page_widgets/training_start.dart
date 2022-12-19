import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

typedef IntCallback = void Function(int val);
typedef StringCallback = void Function(String val);

class TrainingStart extends StatefulWidget {
  final IntCallback stageIndexBack;
  final IntCallback stageIndexNext;
  final IntCallback setRep;
  final StringCallback setDif;
  final int visibleIndex;
  final int setIndex;
  final int repGoal;
  final String movement;

  const TrainingStart(
      {Key? key,
      required this.stageIndexBack,
      required this.visibleIndex,
      required this.setDif,
      required this.setRep,
      required this.stageIndexNext,
      required this.setIndex, required this.repGoal, required this.movement,
      })
      : super(key: key);

  @override
  State<TrainingStart> createState() => _TrainingStartState();
}

class _TrainingStartState extends State<TrainingStart> {
  int? set1Rep;
  String? set1Dif;
  String difficultyLevel = '';
  List<int> visibleIndexes = [1, 3, 5, 7, 9];

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
              child:  Text(
                'Set - ${widget.setIndex}',
                style: const TextStyle(fontSize: 70),
              )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FadeInLeft(
                        delay: const Duration(milliseconds: 700),
                        child:  Center(
                          child: Text(
                            widget.movement != '  Plank' ? 'REP GOAL :' : 'SEC GOAL :',
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ),
                  Expanded(
                    child: FadeInRight(
                        delay: const Duration(milliseconds: 900),
                        child:  Center(
                          child: Text(
                            widget.repGoal.toString(),
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FadeInLeft(
                        delay: const Duration(milliseconds: 1100),
                        child: const Center(
                          child: Text(
                            'You did ? :',
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ),
                  Expanded(
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 1300),
                      child: Center(
                        child: SizedBox(
                          height: 75,
                          width: 125,
                          child: CupertinoPicker(
                            itemExtent: 30,
                            onSelectedItemChanged: (e) {
                              if (e != 0) {
                                set1Rep = e - 1;
                              } else {
                                set1Rep = null;
                              }
                              setState(() {});
                            },
                            scrollController: FixedExtentScrollController(
                                initialItem: set1Rep != null ? (set1Rep! + 1) : 0),
                            children:   List<Widget>.generate(
                              widget.repGoal+2,
                                  (int index) {
                                return Text(index == 0 ? '-' :'${index-1}',style: const TextStyle(color: Colors.white,),);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              FadeIn(
                delay: const Duration(milliseconds: 1600),
                child: Text(
                  'Select How Hard Set-${widget.setIndex} was.',
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                children: [
                  difficultyBoxes(
                      (difficultyLevel == 'Too Easy' || difficultyLevel == '')
                          ? Colors.amber
                          : Colors.blueGrey,
                      'Too Easy',
                      2000),
                  difficultyBoxes(
                      (difficultyLevel == 'Easy' || difficultyLevel == '')
                          ? Colors.yellow
                          : Colors.blueGrey,
                      'Easy',
                      2250),
                  difficultyBoxes(
                      (difficultyLevel == 'Normal' || difficultyLevel == '')
                          ? Colors.greenAccent
                          : Colors.blueGrey,
                      'Normal',
                      2500),
                  difficultyBoxes(
                      (difficultyLevel == 'Hard' || difficultyLevel == '')
                          ? Colors.deepOrangeAccent
                          : Colors.blueGrey,
                      'Hard',
                      2750),
                  difficultyBoxes(
                      (difficultyLevel == 'Too Hard' || difficultyLevel == '')
                          ? Colors.red
                          : Colors.blueGrey,
                      'Too Hard',
                      3000),
                ],
              ),
            ],
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
                  onPressed: (set1Rep == null || set1Dif == null)
                      ? null
                      : () {
                          widget.setRep(set1Rep!);
                          widget.setDif(set1Dif!);
                          (widget.movement == '  Plank' && widget.visibleIndex == 5) ? widget.stageIndexNext(5):widget.stageIndexNext(1);
                          difficultyLevel = '';
                          set1Rep = null;
                          set1Rep = null;

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

  Widget difficultyBoxes(Color color, String difficulty, int delay) {
    return FadeIn(
      delay: Duration(milliseconds: delay),
      child: GestureDetector(
        onTap: () {
          if (difficultyLevel == difficulty) {
            difficultyLevel = '';
            set1Dif = null;
          } else {
            difficultyLevel = difficulty;
            set1Dif = difficulty;
          }
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: color, offset: const Offset(0, 0), blurRadius: 9)
                ]),
            child: Center(
              child: Text(
                difficulty,
                style: const TextStyle(
                  fontSize: 22,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 15)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
