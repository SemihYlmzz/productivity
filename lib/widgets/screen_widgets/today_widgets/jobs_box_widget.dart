import 'package:flutter/material.dart';

class JobsBoxx extends StatelessWidget {
  const JobsBoxx({
    required this.width,
    required this.height,
    required this.color,
    required this.iconData,
    super.key,
  });
  final double width;
  final double height;
  final Color color;
  final IconData iconData;

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
