import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search_clean/clean/data/data_source/result.dart';
import 'package:image_search_clean/clean/domain/repository/photo_api_repository.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';
import 'package:image_search_clean/clean/presentation/home/home_state.dart';
import 'package:image_search_clean/clean/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventController => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    state.isLoading = true;
    notifyListeners();

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        state.photos = photos;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    state.isLoading = false;
    notifyListeners();
  }
}
