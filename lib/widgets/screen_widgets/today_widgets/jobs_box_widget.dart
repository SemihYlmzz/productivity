import 'package:flutter/material.dart';

class JobsBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final IconData iconData;

  const JobsBox({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: color != Colors.white24 ? color : Colors.transparent,
            offset: const Offset(0, 0),
            blurRadius: 15,
          ),
        ],
        borderRadius: BorderRadius.circular(color != Colors.white24 ? 12 : 8),
      ),
      child: Icon(
        iconData,
        size: 60,
        color: Colors.white,
        shadows: const [
          Shadow(
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
    );
  }
}
