import 'package:movies/models/movie_model.dart';
import 'package:movies/repositories/movies/movies_repository.dart';
import 'package:movies/services/movies/movies_service.dart';

class MoviesServiceImpl implements MoviesServie {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() => _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();
}
