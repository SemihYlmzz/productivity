import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with AutomaticKeepAliveClientMixin<HistoryScreen> {
  Random rng = Random();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 400),
      () => scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.black87,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 15,
          ),
          itemCount: 8,
          controller: scrollController,
          itemBuilder: (context, index) => historyBox(index, rng.nextInt(4)),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Center historyBox(int index, int isDone) {
    return Center(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: isDone == 0
                ? [
                    Colors.redAccent,
                    Colors.red,
                  ]
                : (isDone == 1 || isDone == 2)
                    ? [
                        Colors.green,
                        Colors.greenAccent,
                      ]
                    : [
                        Colors.orangeAccent,
                        Colors.yellow,
                      ],
          ),
          boxShadow: [
            BoxShadow(
              color: isDone == 0
                  ? Colors.red
                  : (isDone == 1 || isDone == 2)
                      ? Colors.greenAccent
                      : Colors.yellow,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(
            isDone == 0
                ? CupertinoIcons.clear
                : isDone == 1
                    ? Icons.done_all
                    : isDone == 2
                        ? Icons.done
                        : CupertinoIcons.minus,
            color: Colors.white,
            size: 22,
            shadows: const [
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
