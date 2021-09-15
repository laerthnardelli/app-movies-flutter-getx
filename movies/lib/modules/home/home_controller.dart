import 'package:get/get.dart';

class HomeController extends GetxController {
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == 1) {
      Get.offNamed('/favorites', id: 1);
    } else {
      if (page == 0) {
        Get.offNamed('/movies', id: 1);
      }
    }
  }
}
