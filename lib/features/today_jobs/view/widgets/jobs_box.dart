import '../../../features.dart';

class JobsBox extends ConsumerWidget {
  const JobsBox({
    required this.myJob,
    super.key,
  });

  final Job myJob;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentJob = ref.watch(selectedJobProvider);
    final isMyJobSelected = currentJob == myJob.job;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: isMyJobSelected ? 110 : 100,
        height: isMyJobSelected ? 110 : 100,
        decoration: BoxDecoration(
          color: isMyJobSelected ? Colors.greenAccent : Colors.white24,
          boxShadow: [
            BoxShadow(
              color: currentJob == myJob.job
                  ? Colors.greenAccent
                  : Colors.transparent,
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(isMyJobSelected ? 12 : 8),
        ),
        child: Icon(
          isMyJobSelected ? myJob.selectedIconData : myJob.unSelectedIconData,
          size: 60,
          color: Colors.white,
          shadows: const [
            Shadow(
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
