import 'package:flutter/material.dart';
import 'package:Wedive/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
}

void main() async {
  await setup();
  runApp(const App());
}
