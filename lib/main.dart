import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity/screens/productivity_screens.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black87,
        textTheme: CupertinoTextThemeData(
          textStyle:
              GoogleFonts.dongle(color: Colors.white, fontSize: 35, shadows: [
            const Shadow(
                color: Colors.white, offset: Offset(0, 0), blurRadius: 15),
          ]),
        ),
      ),
      title: 'Productivity',
      home: const ProductivityScreens(),
    );
  }
}
