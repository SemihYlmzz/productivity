import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../providers/today_provider.dart';
import '../todo_widgets/check_box_widget.dart';

typedef IntCallback = void Function(int val);

class ToDoInbox extends StatefulWidget {
  const ToDoInbox({
    required this.currentToDoIndex,
    required this.houseMap,
    required this.bodyMap,
    required this.segmentedIndex,
    required this.changeSegmentedIndex,
    super.key,
  });
  final int currentToDoIndex;
  final int segmentedIndex;
  final List<Map<String, dynamic>> houseMap;
  final List<Map<String, dynamic>> bodyMap;
  final IntCallback? changeSegmentedIndex;

  @override
  State<ToDoInbox> createState() => _ToDoInboxState();
}

class _ToDoInboxState extends State<ToDoInbox> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final todayProvider = Provider.of<TodayProvider>(context);

    return Visibility(
      visible: widget.currentToDoIndex == 1,
      child: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListView.builder(
                      padding: EdgeInsetsDirectional.zero,
                      itemCount: widget.houseMap.length,
                      itemBuilder: (context, index) {
                        final element = widget.houseMap.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            element['isDone'] = !(element['isDone'] as bool);
                            element['isDone'] == true
                                ? {
                                    Provider.of<TodayProvider>(
                                      context,
                                      listen: false,
                                    ).changeTodayPoint(
                                      todayProvider.todayPoint + 10,
                                    ),
                                    HapticFeedback.heavyImpact()
                                  }
                                : {
                                    Provider.of<TodayProvider>(
                                      context,
                                      listen: false,
                                    ).changeTodayPoint(
                                      todayProvider.todayPoint - 10,
                                    ),
                                    HapticFeedback.lightImpact()
                                  };
                            setState(() {});
                          },
                          child: CheckBoxWidget(
                            text: element['mission'] as String,
                            isDone: element['isDone'] as bool,
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsetsDirectional.zero,
                      itemCount: widget.bodyMap.length,
                      itemBuilder: (context, index) {
                        final element = widget.bodyMap.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            element['isDone'] = !(element['isDone'] as bool);
                            element['isDone'] == true
                                ? {
                                    Provider.of<TodayProvider>(
                                      context,
                                      listen: false,
                                    ).changeTodayPoint(
                                      todayProvider.todayPoint + 10,
                                    ),
                                    HapticFeedback.heavyImpact()
                                  }
                                : {
                                    Provider.of<TodayProvider>(
                                      context,
                                      listen: false,
                                    ).changeTodayPoint(
                                      todayProvider.todayPoint - 10,
                                    ),
                                    HapticFeedback.lightImpact()
                                  };
                            setState(() {});
                          },
                          child: CheckBoxWidget(
                            text: element['mission'] as String,
                            isDone: element['isDone'] as bool,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CupertinoSlidingSegmentedControl(
                backgroundColor: Colors.white10,
                thumbColor: Colors.greenAccent.withOpacity(0.75),
                groupValue: widget.segmentedIndex,
                children: const {
                  0: Text(
                    'House',
                    style: TextStyle(fontSize: 24),
                  ),
                  1: Text(
                    'Body',
                    style: TextStyle(fontSize: 24),
                  ),
                },
                onValueChanged: (value) {
                  widget.changeSegmentedIndex!(value!);
                  pageController.animateToPage(
                    value,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 250),
                  );
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
