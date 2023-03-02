import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivity/providers/navigatior_provider.dart';

import '../../../features.dart';

class AppNavigator extends HookConsumerWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verticalPageController = usePageController();
    final horizontalPageController = usePageController(initialPage: 1);
    Future<void> closeIndicator() async {
      await Future.delayed(
        const Duration(milliseconds: 500),
        () => ref.read(showIndicatorProvider.notifier).update((state) => false),
      );
    }

    Future<void> changeCurrentPage(NavigatablePages navigatablePage) async {
      ref.read(currentPageProvider.notifier).update((state) => navigatablePage);
      await closeIndicator();
    }

    useEffect(() {
      horizontalPageController.addListener(() async {
        ref.read(showIndicatorProvider.notifier).update((state) => true);
        if (horizontalPageController.page == 0) {
          await changeCurrentPage(NavigatablePages.jobHistories);
        } else if (horizontalPageController.page == 1) {
          await changeCurrentPage(NavigatablePages.todayJobs);
        } else if (horizontalPageController.page == 2) {
          await changeCurrentPage(NavigatablePages.quitAddictions);
        }
      });
      verticalPageController.addListener(() async {
        ref.read(showIndicatorProvider.notifier).update((state) => true);
        if (verticalPageController.page == 0) {
          await changeCurrentPage(NavigatablePages.todayJobs);
        } else if (verticalPageController.page == 1) {
          await changeCurrentPage(NavigatablePages.changeDetails);
        }
      });

      return null;
    });

    final showIndicator = ref.watch(showIndicatorProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Stack(
        children: [
          PageView(
            controller: horizontalPageController,
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
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 370),
              opacity: showIndicator ? 1 : 0,
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
          ),
        ],
      ),
    );
  }
}

class Indicator extends ConsumerWidget {
  const Indicator({
    required this.pageName,
    super.key,
  });
  final NavigatablePages pageName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: currentPage == pageName ? Colors.blue : Colors.transparent,
            blurRadius: 10,
          )
        ],
        color: currentPage == pageName ? Colors.blue : Colors.grey,
      ),
    );
  }
}
