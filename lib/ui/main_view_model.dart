import 'package:flutter/cupertino.dart';

import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';
import 'package:image_search_clean/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepositoryImpl _repository;

  MainState _state = MainState(
    imageItems: List.unmodifiable([]),
    isLoading: false,
  );

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepositoryImpl repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
      imageItems: List.unmodifiable(
          (await _repository.getImageItems(query)).take(3).toList()),
    );
    notifyListeners();
  }
}
