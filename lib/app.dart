import 'package:Wedive/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:Wedive/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WeDive',
      themeMode: ThemeMode.system,
      theme: WediveTheme.lightTheme,
      darkTheme: WediveTheme.darkTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
