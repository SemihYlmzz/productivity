import 'package:productivity/features/features.dart';

final currentPageProvider = StateProvider<NavigatablePages>((ref) {
  return NavigatablePages.todayJobs;
});

final showIndicatorProvider = StateProvider<bool>((ref) {
  return false;
});
