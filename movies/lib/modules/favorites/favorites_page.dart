import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/application/ui/widgets/movie_card.dart';
import 'package:movies/modules/favorites/favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (m) => MovieCard(
                      movie: m,
                      favoriteCallback: () => controller.removeFavorites(m),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
