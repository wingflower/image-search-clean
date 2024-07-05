import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_search_clean/clean/data/data_source/result.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';
import 'package:image_search_clean/clean/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_clean/clean/presentation/home/home_state.dart';
import 'package:image_search_clean/clean/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = const HomeState();

  HomeState get state => _state;

  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventController => _eventController.stream;

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
