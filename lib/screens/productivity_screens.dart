import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/all_screens/results_screen.dart';
import '../screens/day_screens.dart';
import '../widgets/global_widgets/indicator_widget.dart';

class ProductivityScreens extends StatefulWidget {
  const ProductivityScreens({Key? key}) : super(key: key);

  @override
  State<ProductivityScreens> createState() => _ProductivityScreensState();
}

class _ProductivityScreensState extends State<ProductivityScreens> {
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool isIndicatorVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (int page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            DayScreens(indexValue: (v) {
              v == 1 ? isIndicatorVisible = true : isIndicatorVisible = false;
              setState(() {});
            }),
            const ResultsScreen(),
          ],
        ),
        AnimatedOpacity(
          duration: const Duration(
            milliseconds: 400,
          ),
          opacity: isIndicatorVisible ? 1 : 0,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  indicator(selectedIndex == 0),
                  indicator(selectedIndex == 1),
                ],
              )),
        ),
      ],
    );
  }
}
