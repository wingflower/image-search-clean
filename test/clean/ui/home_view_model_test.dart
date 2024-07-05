import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_clean/clean/data/data_source/result.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';
import 'package:image_search_clean/clean/domain/repository/photo_api_repository.dart';
import 'package:image_search_clean/clean/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_clean/clean/presentation/home/home_view_model.dart';


void main() {
  test('Stream Test', () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2788599,
    "pageURL": "https://pixabay.com/photos/apples-red-apple-ripe-apple-orchard-2788599/",
    "type": "photo",
    "tags": "apples, red apple, ripe",
    "previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g3f79924914d016121ae89188e79d02327080d8ba60933a1dcb15537c6ff05b8494735a4289e74fe3e340682f48dbdac47814737702dc05956851147e9b8ddc19_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/geae2b4521f5532523308d2cad101c2d12933d1cc87c6675352fde46159e33bc0c8036f4cfbfb412f8150c724eb8ccfc47e5951e5efaaadd9eacd8ec7832c05bd_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3660484,
    "views": 162903,
    "downloads": 91864,
    "collections": 586,
    "likes": 651,
    "comments": 76,
    "user_id": 2364555,
    "user": "NoName_13",
    "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
  },
  {
    "id": 256261,
    "pageURL": "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL": "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/gc6d68a7a4eea50d90f6589ba9941b4bc66fba6c8a01433e8411bd3cda5a16f4ea4e83920fdf342ec2ad04a0db3c1ea2c_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL": "https://pixabay.com/get/g051de6368c3567b778c2082cb1071a171942ffd26be6a5cd3d3702611bb5856fffff716a0676ce9d40d131be123ef38f0008c3b14e219bf311540b3138c92963_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 597848,
    "downloads": 334501,
    "collections": 1026,
    "likes": 1047,
    "comments": 255,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL": "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  }
];