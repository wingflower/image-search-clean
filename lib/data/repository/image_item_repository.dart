import 'package:image_search_clean/core/result.dart';
import 'package:image_search_clean/data/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}