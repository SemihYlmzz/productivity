import 'package:firebase_core/firebase_core.dart';
import 'package:productivity/features/features.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: App()),
  );
}
