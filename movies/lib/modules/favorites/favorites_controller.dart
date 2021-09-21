import 'package:get/get.dart';
import 'package:movies/application/auth/auth_service.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/services/movies/movies_service.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  final movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  Future<void> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorites(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(user.uid, movie.copyWith(favorite: false));
      movies.remove(movie); //posso fazer dessa forma removendo da minha lista, deixando GetX se encarregar disso, ou fazer novamente uma busca de getFavorites
    }
  }

  @override
  void onReady() {
    super.onReady();
    getFavorites();
  }
}
