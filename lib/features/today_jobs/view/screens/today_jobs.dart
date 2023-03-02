import 'package:productivity/features/today_jobs/view/widgets/jobs_box.dart';

import '../../../features.dart';

class TodayJobs extends HookConsumerWidget {
  const TodayJobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    final jobsList = ref.watch(jobsListProvider);
    final currentJob = ref.watch(currentJobProvider);
    return Container(
      padding: const EdgeInsets.all(8),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: PageView(
                  controller: pageController,
                  //     physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Center(child: Text('Sleep Cycle')),
                    Center(child: Text('To-Do Cycle')),
                    Center(child: Text('Sport Cycle')),
                    Center(child: Text('Book Cycle')),
                    Center(child: Text('Unknown Cycle')),
                    Center(child: Text('inTake Cycle')),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 275,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: jobsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (jobsList[index].job == currentJob) {
                      ref
                          .read(currentJobProvider.notifier)
                          .update((state) => Jobs.empty);
                    } else {
                      ref
                          .read(currentJobProvider.notifier)
                          .update((state) => jobsList[index].job);
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 370),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: JobsBox(
                    selectedIconData: jobsList[index].selectedIconData,
                    unSelectedIconData: jobsList[index].unSelectedIconData,
                    myJob: jobsList[index].job,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
