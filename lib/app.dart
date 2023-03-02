import 'package:provider/provider.dart' as oldProvider; // TODO: Kaldır

import 'features/features.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return oldProvider.MultiProvider(
      providers: [
        oldProvider.ChangeNotifierProvider(create: (_) => TodayProvider())
      ],
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
        home: AppNavigator(
          leftScreen: Container(
            color: Colors.white10,
          ),
          rightScreen: Container(
            color: Colors.white10,
          ),
          bottomScreen: Container(
            color: Colors.white10,
          ),
          middleScreen: Container(
            color: Colors.white10,
          ),
        ),
      ),
    );
  }
}
