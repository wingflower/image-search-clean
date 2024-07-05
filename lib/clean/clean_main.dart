import 'package:flutter/material.dart';
import 'package:image_search_clean/clean/domain/use_case/get_photos_use_case.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_search_clean/clean/data/data_source/pixabay_api.dart';
import 'package:image_search_clean/clean/data/repository/pixabay_api_repository_impl.dart';
import 'package:image_search_clean/clean/presentation/home/home_screen.dart';
import 'package:image_search_clean/clean/presentation/home/home_view_model.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(GetPhotosUseCase(PixabayApiRepositoryImpl(PixabayApi(http.Client())))),
        child: const HomeScreen(),
      ),
    );
  }
}
