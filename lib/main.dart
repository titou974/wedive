import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedive/firebase_options.dart';
import 'package:wedive/utils/theme/theme.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedive',
      themeMode: ThemeMode.system,
      theme: WediveTheme.lightTheme,
      darkTheme: WediveTheme.darkTheme,
    );
  }
}
