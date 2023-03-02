import 'package:flutter/material.dart';

import 'all_screens/history_screen.dart';
import 'all_screens/today_screen.dart';

typedef StringCallback = void Function(int val);

class DayScreens extends StatefulWidget {
  const DayScreens({required this.indexValue, super.key});
  final StringCallback indexValue;

  @override
  State<DayScreens> createState() => _DayScreensState();
}

class _DayScreensState extends State<DayScreens>
    with AutomaticKeepAliveClientMixin<DayScreens> {
  PageController pageController = PageController(initialPage: 1);
  int selectedindex = 1;
  List<Widget> pages = [
    const HistoryScreen(),
    const TodayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(
      onPageChanged: (int page) {
        setState(() {
          selectedindex = page;
        });
        widget.indexValue(selectedindex);
      },
      itemCount: 2,
      controller: pageController,
      itemBuilder: (context, index) => pages[index],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
