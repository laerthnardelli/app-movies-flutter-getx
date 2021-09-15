import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies/application/ui/filmes_app_ui_config.dart';
import 'package:movies/modules/login/login_module.dart';

import 'application/bindings/aplication_bindings.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //final remoteConfig = RemoteConfig.instance;
  //remoteConfig.fetchAndActivate();
  RemoteConfig.instance.fetchAndActivate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
