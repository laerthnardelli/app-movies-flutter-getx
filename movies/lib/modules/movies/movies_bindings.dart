import 'package:get/get.dart';
import 'package:movies/modules/movies/movies_controller.dart';
import 'package:movies/repositories/genres/genres_repository.dart';
import 'package:movies/repositories/genres/genres_repository_impl.dart';
import 'package:movies/services/genres/genres_service.dart';
import 'package:movies/services/genres/genres_service_impl.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(
          genresService: Get.find(),
          moviesService: Get.find(),
        ));
  }
}
