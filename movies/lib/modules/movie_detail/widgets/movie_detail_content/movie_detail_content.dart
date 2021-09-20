import 'package:flutter/material.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/modules/movie_detail/widgets/movie_detail_content/movie_detail_content_title.dart';
import 'package:movies/modules/movie_detail/widgets/movie_detail_content_credits.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
      ],
    );
  }
}
