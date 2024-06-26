import 'dart:convert';

import 'package:image_search_clean/data/dto/image_dto.dart';
import 'package:http/http.dart' as http;

class ImageApi {
  Future<ImageDto> getImageItems(String query) async {
    final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo',
    ));
    return ImageDto.fromJson(jsonDecode(response.body));
  }
}
