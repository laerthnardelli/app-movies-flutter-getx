import 'package:movies/models/movie_model.dart';

abstract class MoviesServie {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
}