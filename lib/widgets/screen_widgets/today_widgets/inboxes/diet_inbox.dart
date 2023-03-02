import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DietInbox extends StatelessWidget {
  const DietInbox({required this.currentToDoIndex, super.key});
  final int currentToDoIndex;

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
