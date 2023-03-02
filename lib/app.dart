import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity/features/navigation/view/screens/app_navigator.dart';
import 'package:productivity/providers/today_provider.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodayProvider())],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black87,
          textTheme: CupertinoTextThemeData(
            textStyle: GoogleFonts.dongle(
              color: Colors.white,
              fontSize: 35,
              shadows: [
                const Shadow(
                  color: Colors.white,
                  blurRadius: 15,
                ),
              ],
            ),
          ),
        ),
        title: 'Productivity',
        home: const AppNavigator(),
      ),
    );
  }
}
