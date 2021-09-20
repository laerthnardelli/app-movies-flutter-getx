import 'package:flutter/material.dart';

import 'package:movies/models/movie_detail_model.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData =
        movie; //nullSafety tem a auto promoção de tipos, o que faz ter que sempre checar, porem dessa forma eu evito de ter que colocar as exclamações
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages
              .length, //itemCount: movie!.urlImages.length,   //não preciso forçar o "!"
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    }
    return SizedBox.shrink();
  }
}
