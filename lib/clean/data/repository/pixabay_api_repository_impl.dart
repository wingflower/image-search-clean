import 'package:image_search_clean/clean/data/data_source/pixabay_api.dart';
import 'package:image_search_clean/clean/domain/repository/photo_api_repository.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';


class PixabayApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PixabayApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}