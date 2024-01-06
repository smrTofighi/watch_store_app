import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/components/theme.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/route/routes.dart';


void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Store',
      theme: lightTheme(),
      routes: routes,
      initialRoute: ScreensName.root,
    );
  }
}
