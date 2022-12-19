import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WaterInbox extends StatelessWidget {
  final int currentToDoIndex;
  const WaterInbox({Key? key, required this.currentToDoIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentToDoIndex == 5,
      child: FadeInRight(
        child: const Center(
          child: Text('Water'),
        ),
      ),
    );
  }
}
