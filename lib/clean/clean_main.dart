import 'package:flutter/material.dart';

import 'package:image_search_clean/clean/data/pixabay_api.dart';
import 'package:image_search_clean/clean/data/photo_provider.dart';
import 'package:image_search_clean/clean/ui/home_screen.dart';
import 'package:image_search_clean/clean/ui/home_view_model.dart';

void main() {
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
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
