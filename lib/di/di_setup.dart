import 'package:get_it/get_it.dart';

import 'package:image_search_clean/data/repository/image_item_repository.dart';
import 'package:image_search_clean/data/repository/image_item_repository_impl.dart';
import 'package:image_search_clean/ui/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepositoryImpl>()));
}
