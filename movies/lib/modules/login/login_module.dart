import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/application/modules/module.dart';
import 'package:movies/modules/login/login_bindings.dart';
import 'package:movies/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
