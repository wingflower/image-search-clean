import 'package:image_search_clean/clean/data/data_source/pixabay_api.dart';
import 'package:image_search_clean/clean/data/data_source/result.dart';
import 'package:image_search_clean/clean/domain/repository/photo_api_repository.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';

class PixabayApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PixabayApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
