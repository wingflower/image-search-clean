import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_clean/clean/model/photo.dart';


class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '10711147-dc41758b93b263957026bdadb';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}