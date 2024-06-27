import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';
import 'package:image_search_clean/di/di_setup.dart';

import 'package:image_search_clean/ui/main_screen.dart';
import 'package:image_search_clean/ui/main_view_model.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Search Clean App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MainViewModel(
          repository: ImageItemRepositoryImpl(),
        ),
        child: const MainScreen(),
      )
    );
  }
}