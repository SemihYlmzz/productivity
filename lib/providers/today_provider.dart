import 'package:flutter/cupertino.dart';

class TodayProvider with ChangeNotifier {
  TodayProvider({this.todayPoint = 0});
  int todayPoint;

  changeTodayPoint(int newTodayPoint) {
    todayPoint = newTodayPoint;
    notifyListeners();
  }
}
