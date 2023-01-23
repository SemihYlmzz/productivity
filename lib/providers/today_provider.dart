import 'package:flutter/cupertino.dart';

class TodayProvider with ChangeNotifier {
  int todayPoint;

  TodayProvider({this.todayPoint = 0});

  changeTodayPoint(int newTodayPoint){
    todayPoint = newTodayPoint;
    notifyListeners();
  }
}