import '../../../features.dart';

class JobsBox extends ConsumerWidget {
  const JobsBox({
    required this.selectedIconData,
    required this.unSelectedIconData,
    required this.myJob,
    super.key,
  });

  final IconData selectedIconData;
  final IconData unSelectedIconData;
  final Jobs myJob;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentJob = ref.watch(currentJobProvider);

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: currentJob == myJob ? 110 : 100,
        height: currentJob == myJob ? 110 : 100,
        decoration: BoxDecoration(
          color: currentJob == myJob ? Colors.greenAccent : Colors.white24,
          boxShadow: [
            BoxShadow(
              color:
                  currentJob == myJob ? Colors.greenAccent : Colors.transparent,
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(currentJob == myJob ? 12 : 8),
        ),
        child: Icon(
          currentJob == myJob ? selectedIconData : unSelectedIconData,
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
