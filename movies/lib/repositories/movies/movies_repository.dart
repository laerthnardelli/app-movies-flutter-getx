import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id); //retornar como opcional caso não tenha.
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
}
