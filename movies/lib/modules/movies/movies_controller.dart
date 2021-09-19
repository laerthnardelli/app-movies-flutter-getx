import 'package:get/get.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/services/genres/genres_service.dart';
import 'package:movies/services/movies/movies_service.dart';

class MoviesController extends GetxController with MaessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  final _popularMoviesOriginal = <MovieModel>[];
  final _topRatedMoviesOriginal = <MovieModel>[];

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService})
      : _genresService = genresService,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      genresData.assignAll(genres);

      final popularMoviesData = await _moviesService.getPopularMovies();
      popularMovies.assignAll(popularMoviesData);

      final topRatedMoviesData = await _moviesService.getTopRated();
      topRatedMovies.assignAll(topRatedMoviesData);

    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar dados da página'));
    }
  }
}
