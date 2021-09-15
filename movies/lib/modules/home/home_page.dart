import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/application/ui/filmes_app_icons_icons.dart';
import 'package:movies/application/ui/theme_extensions.dart';
import 'package:movies/modules/favorites/favorites_page.dart';
import 'package:movies/modules/home/home_controller.dart';
import 'package:movies/modules/movies/movies_page.dart';

class HomePage extends GetView<HomeController> {
  //final controller = Get.find<HomeController>();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => MoviesPage(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesPage(),
            );
          }
          return null;
        },
      ),
    );
  }
}
