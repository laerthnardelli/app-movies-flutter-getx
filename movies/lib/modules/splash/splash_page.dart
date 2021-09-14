//import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  //var controller = Get.put(SplashController());

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width, //width: MediaQuery.of(context).size.width,
          height: Get.height, //height: MediaQuery.of(context).size.height,
          //child: Text(RemoteConfig.instance.getString('api_token')),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
