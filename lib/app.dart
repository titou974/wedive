import 'package:Wedive/features/auth/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wedive',
      themeMode: ThemeMode.system,
      theme: WediveTheme.lightTheme,
      darkTheme: WediveTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
