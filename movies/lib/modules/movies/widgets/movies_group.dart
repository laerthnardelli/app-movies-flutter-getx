import 'package:flutter/material.dart';
import 'package:movies/application/ui/widgets/movie_card.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  const MoviesGroup({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          MovieCard(),
        ],
      ),
    );
  }
}
