import 'package:get/get.dart';
import 'package:movies/repositories/login/login_repository.dart';
import 'package:movies/repositories/login/login_repository_impl.dart';
import 'package:movies/services/login/login_service.dart';
import 'package:movies/services/login/login_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
  }
}
