import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id); //nosso contrato
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
   Future<List<MovieModel>> getFavoritiesMovies(String userId);
}