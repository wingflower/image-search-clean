import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_search_clean/core/result.dart';
import 'package:image_search_clean/data/model/image_item.dart';
import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';
import 'package:image_search_clean/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepositoryImpl _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepositoryImpl repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageItems(query);
    switch (result) {
      case Success<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(3).toList(),
        );
        notifyListeners();
      case Error<List<ImageItem>>():
        print("Error");
      case Loading<List<ImageItem>>():
        print("Loading");
    }
  }
}
