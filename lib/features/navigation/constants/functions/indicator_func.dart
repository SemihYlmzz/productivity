import '../../../features.dart';

class NavigationIndicatorFuctions {
  static Future<void> closeIndicator(WidgetRef ref) async => {
        await Future.delayed(
          const Duration(seconds: 1),
          () =>
              ref.read(showIndicatorProvider.notifier).update((state) => false),
        )
      };

  static void showIndicator(WidgetRef ref) =>
      {ref.read(showIndicatorProvider.notifier).update((state) => true)};
}
