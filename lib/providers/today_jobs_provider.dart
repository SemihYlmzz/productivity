import '../features/features.dart';

final jobsListProvider = StateProvider<List<Job>>((ref) {
  return [
    Job(
      Jobs.sleep,
      CupertinoIcons.sunrise_fill,
      CupertinoIcons.sunrise,
    ),
    Job(
      Jobs.toDo,
      CupertinoIcons.check_mark_circled_solid,
      CupertinoIcons.check_mark_circled,
    ),
    Job(
      Jobs.sport,
      CupertinoIcons.bolt_circle_fill,
      CupertinoIcons.bolt_circle,
    ),
    Job(
      Jobs.book,
      CupertinoIcons.book_circle_fill,
      CupertinoIcons.book_circle,
    ),
    Job(
      Jobs.unknown,
      CupertinoIcons.square_stack_3d_down_right_fill,
      CupertinoIcons.square_stack_3d_down_right,
    ),
    Job(
      Jobs.inTake,
      CupertinoIcons.flame_fill,
      CupertinoIcons.flame,
    ),
  ];
});

final currentJobProvider = StateProvider<Jobs>((ref) {
  return Jobs.empty;
});
