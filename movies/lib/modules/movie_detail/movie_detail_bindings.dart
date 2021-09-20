import 'package:get/get.dart';
import 'package:movies/modules/movie_detail/movie_detail_controller.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoveiDetailController(moviesService: Get.find()));
  }
}
