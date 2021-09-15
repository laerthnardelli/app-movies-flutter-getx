import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/application/ui/filmes_app_icons_icons.dart';
import 'package:movies/application/ui/theme_extensions.dart';
import 'package:movies/modules/favorites/favorites_page.dart';
import 'package:movies/modules/movies/movies_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.themeRed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
          BottomNavigationBarItem(
              icon: Icon(FilmesAppIcons.heart_empty), label: 'Filmes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined), label: 'Sair'),
        ],
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(1),
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
