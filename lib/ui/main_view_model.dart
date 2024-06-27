import 'package:flutter/cupertino.dart';
import 'package:image_search_clean/data/model/image_item.dart';
import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';

class MainViewModel extends ChangeNotifier {
  final repository = ImageItemRepositoryImpl();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(query);

    isLoading = false;
    notifyListeners();
  }
}