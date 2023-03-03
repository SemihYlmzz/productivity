import '../../features.dart';

class Job {
  Job({
    required this.job,
    required this.selectedIconData,
    required this.unSelectedIconData,
  });
  final Jobs job;
  final IconData selectedIconData;
  final IconData unSelectedIconData;
}
