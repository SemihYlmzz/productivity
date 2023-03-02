import 'package:flutter/material.dart';

Widget indicator(bool isActive) {
  return Padding(
    padding: const EdgeInsets.all(3),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 10 : 8.0,
      width: isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        boxShadow: [
          if (isActive)
            const BoxShadow(
              color: Color(0XFF2FB7B2),
              blurRadius: 4,
              spreadRadius: 1,
            )
          else
            const BoxShadow(
              color: Colors.transparent,
            )
        ],
        shape: BoxShape.circle,
        color: isActive
            ? const Color(0XFF6BC4C9).withOpacity(0.4)
            : Colors.white24.withOpacity(0.25),
      ),
    ),
  );
}
