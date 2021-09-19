import 'package:get/get.dart';
import 'package:movies/application/auth/auth_service.dart';
import 'package:movies/application/rest_client/rest_client.dart';
import 'package:movies/repositories/login/login_repository.dart';
import 'package:movies/repositories/login/login_repository_impl.dart';
import 'package:movies/repositories/movies/movies_repository.dart';
import 'package:movies/repositories/movies/movies_repository_impl.dart';
import 'package:movies/services/login/login_service.dart';
import 'package:movies/services/login/login_service_impl.dart';
import 'package:movies/services/movies/movies_service.dart';
import 'package:movies/services/movies/movies_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();

    Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<MoviesServie>(() => MoviesServiceImpl(moviesRepository: Get.find()));
  }
}


