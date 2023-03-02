import 'package:productivity/features/features.dart';

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
