import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LanguageInbox extends StatelessWidget {
  final int currentToDoIndex;
  const LanguageInbox({Key? key, required this.currentToDoIndex}) : super(key: key);

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
