import '../../../features.dart';

class AppNavigator extends HookConsumerWidget {
  const AppNavigator({
    required this.leftScreen,
    required this.rightScreen,
    required this.bottomScreen,
    required this.middleScreen,
    super.key,
  });
  final Widget leftScreen;
  final Widget rightScreen;
  final Widget bottomScreen;
  final Widget middleScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verticalPageController = usePageController();
    final horizontalPageController = usePageController(initialPage: 1);

    return CupertinoPageScaffold(
      navigationBar: navigationAppBar(),
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
                  leftScreen,
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: verticalPageController,
                    children: [
                      middleScreen,
                      bottomScreen,
                    ],
                  ),
                  rightScreen,
                ],
              );
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PageIndicatorShower(
                horizontalPageController: horizontalPageController,
                verticalPageController: verticalPageController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
