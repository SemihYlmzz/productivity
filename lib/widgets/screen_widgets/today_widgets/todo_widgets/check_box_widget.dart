import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isDone;
  final String text;

  const CheckBoxWidget({Key? key, required this.isDone, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? Colors.greenAccent : Colors.white12,
                border: Border.all(
                  color: isDone ? Colors.white : Colors.white54,
                ),
              ),
              child: Icon(
                Icons.done,
                color: isDone ? Colors.white : Colors.transparent,
                size: 22,
                shadows: [
                  Shadow(
                    color: isDone ? Colors.black : Colors.transparent,
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
