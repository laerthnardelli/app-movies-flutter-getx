

import 'package:movies/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
