import 'package:image_search_clean/clean/data/data_source/result.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}