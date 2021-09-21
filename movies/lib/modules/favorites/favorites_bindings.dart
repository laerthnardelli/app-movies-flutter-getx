import 'package:get/get.dart';
import 'package:movies/modules/favorites/favorites_controller.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController(
      authService: Get.find(),
      moviesService: Get.find(),
    ));
  }
}
