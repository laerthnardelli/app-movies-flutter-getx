import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/application/modules/module.dart';
import 'package:movies/modules/splash/splash_bindings.dart';
import 'package:movies/modules/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
