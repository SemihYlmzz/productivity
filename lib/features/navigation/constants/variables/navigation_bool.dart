class NavigationBool {
  static bool isCurrentPage2(double? currenPageDouble) =>
      (currenPageDouble ?? 0) > 1.5;
  static bool isCurrentPage1(double? currenPageDouble) =>
      (currenPageDouble ?? 0) > 0.5;
}
