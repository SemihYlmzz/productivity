import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features.dart';

class TodayJobs extends HookConsumerWidget {
  const TodayJobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    //  final ownedJobsViewModel = ref.watch(ownedJobsProvider);
    //  final currentJobViewModel = ref.watch(selectedJobProvider);

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
            SizedBox(
              height: 275,
              child:

                  /// ownedJobsViewModel.isEmpty
                  ///    ?
                  GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc('myID')
                      .update({
                    'ownedJobs': [Jobs.empty.toString()]
                  });
                },
                child: const Center(
                  child: Text('Tap to add job.'),
                ),
              ),
              // : GridView.builder(
              //     padding: const EdgeInsets.only(top: 16),
              //     itemCount: ownedJobsViewModel.length,
              //     gridDelegate:
              //         const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //     ),
              //     itemBuilder: (context, index) => GestureDetector(
              //       onTap: () {
              //         if (ownedJobsViewModel[index].job ==
              //             currentJobViewModel) {
              //           ref
              //               .read(selectedJobProvider.notifier)
              //               .update((state) => Jobs.empty);
              //         } else {
              //           ref.read(selectedJobProvider.notifier).update(
              //                 (state) => ownedJobsViewModel[index].job,
              //               );
              //           pageController.animateToPage(
              //             index,
              //             duration: const Duration(milliseconds: 370),
              //             curve: Curves.decelerate,
              //           );
              //         }
              //       },
              //       child: JobsBox(
              //         myJob: ownedJobsViewModel[index],
              //       ),
              //     ),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
