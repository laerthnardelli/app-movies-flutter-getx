import 'package:flutter/material.dart';
import 'package:movies/modules/movies/widgets/filter_tag.dart';

class MoviesFilters extends StatelessWidget {
  const MoviesFilters({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterTag(),
            FilterTag(),
            FilterTag(),
            FilterTag(),
            FilterTag(),
          ],
        ),
      ),
    );
  }
}