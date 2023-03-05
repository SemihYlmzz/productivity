import '../features/features.dart';

final jobsListProvider = StateProvider<List<Job>>((ref) {
  return [
    Job(
      job: Jobs.sleep,
      selectedIconData: CupertinoIcons.sunrise_fill,
      unSelectedIconData: CupertinoIcons.sunrise,
    ),
    Job(
      job: Jobs.toDo,
      selectedIconData: CupertinoIcons.check_mark_circled_solid,
      unSelectedIconData: CupertinoIcons.check_mark_circled,
    ),
    Job(
      job: Jobs.sport,
      selectedIconData: CupertinoIcons.bolt_circle_fill,
      unSelectedIconData: CupertinoIcons.bolt_circle,
    ),
    Job(
      job: Jobs.book,
      selectedIconData: CupertinoIcons.book_circle_fill,
      unSelectedIconData: CupertinoIcons.book_circle,
    ),
    Job(
      job: Jobs.unknown,
      selectedIconData: CupertinoIcons.square_stack_3d_down_right_fill,
      unSelectedIconData: CupertinoIcons.square_stack_3d_down_right,
    ),
    Job(
      job: Jobs.inTake,
      selectedIconData: CupertinoIcons.flame_fill,
      unSelectedIconData: CupertinoIcons.flame,
    ),
  ];
});

final selectedJobProvider = StateProvider<Jobs?>((ref) {
  return null;
});
