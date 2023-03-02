import '../../../features.dart';

class AppNavigator extends HookConsumerWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verticalPageController = usePageController();
    final horizontalPageController = usePageController(initialPage: 1);

    useEffect(() {
      horizontalPageController.addListener(() async {
        NavigationIndicatorFuctions.showIndicator(ref);
        if (NavigationBool.isCurrentPage2(horizontalPageController.page)) {
          await NavigationPageFunctions.changeCurrentPage(
            navigatablePage: NavigatablePages.quitAddictions,
            ref: ref,
          );
        } else if (NavigationBool.isCurrentPage1(
          horizontalPageController.page,
        )) {
          await NavigationPageFunctions.changeCurrentPage(
            navigatablePage: NavigatablePages.todayJobs,
            ref: ref,
          );
        } else {
          await NavigationPageFunctions.changeCurrentPage(
            navigatablePage: NavigatablePages.jobHistories,
            ref: ref,
          );
        }
      });
      verticalPageController.addListener(() async {
        ref.read(showIndicatorProvider.notifier).update((state) => true);
        if (NavigationBool.isCurrentPage1(verticalPageController.page)) {
          await NavigationPageFunctions.changeCurrentPage(
            navigatablePage: NavigatablePages.changeDetails,
            canSwipeHorizontally: false,
            ref: ref,
          );
        } else {
          await NavigationPageFunctions.changeCurrentPage(
            navigatablePage: NavigatablePages.todayJobs,
            ref: ref,
          );
        }
      });

      return null;
    });

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final canSwipeHorizontaly =
                  ref.watch(canSwipeHorizontalyProvider);

              return PageView(
                controller: horizontalPageController,
                physics: canSwipeHorizontaly
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.greenAccent.withOpacity(0.2),
                  ),
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: verticalPageController,
                    children: [
                      Container(
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      Container(
                        color: Colors.redAccent.withOpacity(0.2),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.purpleAccent.withOpacity(0.2),
                  ),
                ],
              );
            },
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PageIndicatorShower(),
            ),
          ),
        ],
      ),
    );
  }
}
