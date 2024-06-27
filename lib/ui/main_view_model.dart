import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';
import 'package:image_search_clean/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepositoryImpl _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepositoryImpl repository,
  }) : _repository = repository;

  Future<bool> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final results = (await _repository.getImageItems(query)).take(3).toList();

      _state = state.copyWith(
        isLoading: false,
        imageItems: results,
      );
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
