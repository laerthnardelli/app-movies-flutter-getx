import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/movie_detail/movie_detail_controller.dart';
import 'package:movies/modules/movie_detail/widgets/movie_detail_content/movie_detail_content.dart';
import 'package:movies/modules/movie_detail/widgets/movie_detail_content/movie_detail_header.dart';

class MovieDetailPage extends GetView<MoveiDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
              MovieDetailContent(movie: controller.movie.value),
            ],
          );
        }),
      ),
    );
  }
}
