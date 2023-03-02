import 'package:productivity/features/features.dart';

import 'app.dart';

void main() async {
  runApp(
    const ProviderScope(child: App()),
  );
}
