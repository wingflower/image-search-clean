import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_clean/clean/data/photo_api_repository.dart';
import 'package:image_search_clean/clean/model/photo.dart';


class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '10711147-dc41758b93b263957026bdadb';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    // final response = await http.get(Uri.parse(
    final response = await client.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));
        // 'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}