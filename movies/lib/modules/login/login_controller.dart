import 'package:get/get.dart';
import 'package:movies/application/ui/loader/loader_mixin.dart';

class LoginController extends GetxController with LoaderMixin {
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  void login() async {

    loading.value = true;
    await 2.seconds.delay();
    //await Future.delayed(Duration(seconds: 2));
    //loading.value = false;
    loading(false);
  }
}
