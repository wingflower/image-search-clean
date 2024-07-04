import 'package:image_search_clean/clean/domain/model/photo.dart';

class HomeState {
  List<Photo> photos;
  bool isLoading;

  HomeState(this.photos, this.isLoading);
}