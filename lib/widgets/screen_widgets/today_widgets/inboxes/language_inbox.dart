import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LanguageInbox extends StatelessWidget {
  const LanguageInbox({required this.currentToDoIndex, super.key});
  final int currentToDoIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentToDoIndex == 3,
      child: FadeInUp(
        child: const Center(
          child: Text('Language'),
        ),
      ),
    );
  }
}
