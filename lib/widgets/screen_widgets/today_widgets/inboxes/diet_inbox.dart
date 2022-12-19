import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DietInbox extends StatelessWidget {
  final int currentToDoIndex;
  const DietInbox({Key? key, required this.currentToDoIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentToDoIndex == 4,
      child: FadeInUp(
        child: const Center(
          child: Text('Diet'),
        ),
      ),
    );
  }
}
