import 'package:image_search_clean/data/data_source/image_api.dart';
import 'package:image_search_clean/data/mapper/image_mapper.dart';
import 'package:image_search_clean/data/model/image_item.dart';
import 'package:image_search_clean/data/repository/image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageItems(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}