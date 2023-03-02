import '../../../features.dart';

class NavigationPageFunctions {
  static Future<void> changeCurrentPage({
    required NavigatablePages navigatablePage,
    required WidgetRef ref,
    bool canSwipeHorizontally = true,
  }) async =>
      {
        ref
            .read(currentPageProvider.notifier)
            .update((state) => navigatablePage),
        ref
            .read(canSwipeHorizontalyProvider.notifier)
            .update((state) => canSwipeHorizontally),
        await NavigationIndicatorFuctions.closeIndicator(ref),
      };
}
