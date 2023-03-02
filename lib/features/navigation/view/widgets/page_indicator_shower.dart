import 'package:productivity/features/features.dart';

class PageIndicatorShower extends HookConsumerWidget {
  const PageIndicatorShower({
    this.horizontalPageController,
    this.verticalPageController,
    super.key,
  });
  final PageController? horizontalPageController;
  final PageController? verticalPageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      if (horizontalPageController != null && verticalPageController != null) {
        horizontalPageController!.addListener(() async {
          NavigationIndicatorFuctions.showIndicator(ref);
          if (NavigationBool.isCurrentPage2(horizontalPageController!.page)) {
            await NavigationPageFunctions.changeCurrentPage(
              navigatablePage: NavigatablePages.quitAddictions,
              ref: ref,
            );
          } else if (NavigationBool.isCurrentPage1(
            horizontalPageController!.page,
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
        verticalPageController!.addListener(() async {
          ref.read(showIndicatorProvider.notifier).update((state) => true);
          if (NavigationBool.isCurrentPage1(verticalPageController!.page)) {
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
      }

      return null;
    });

    final showIndicator = ref.watch(showIndicatorProvider);

    return IgnorePointer(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: showIndicator ? 0.85 : 0,
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Indicator(pageName: NavigatablePages.jobHistories),
                  Indicator(pageName: NavigatablePages.todayJobs),
                  Indicator(
                    pageName: NavigatablePages.quitAddictions,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Indicator(pageName: NavigatablePages.changeDetails),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
