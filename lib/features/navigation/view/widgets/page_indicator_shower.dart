import 'package:productivity/features/features.dart';

class PageIndicatorShower extends ConsumerWidget {
  const PageIndicatorShower({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
