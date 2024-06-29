import 'package:flutter/material.dart';
import 'package:image_search_clean/routes.dart';
import 'package:image_search_clean/di/di_setup.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      // title: Text('Image Search Clean App', style: TextStyle(color: Colors.black),),
      title: 'Image Search Clean App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
    );
  }
}
