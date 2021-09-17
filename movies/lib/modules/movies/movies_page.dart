import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/movies/widgets/movies_filters.dart';
import 'package:movies/modules/movies/widgets/movies_group.dart';
import 'package:movies/modules/movies/widgets/movies_header.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          MoviesHeader(),
          MoviesFilters(),
          MoviesGroup(title: 'Mais populares'),
          MoviesGroup(title: 'Top filmes'),
        ],
      ),
    );
  }
}
