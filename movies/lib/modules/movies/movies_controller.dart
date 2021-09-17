import 'package:get/get.dart';
import 'package:movies/services/login/genres/genres_service.dart';

class MoviesController extends GetxController {
  final GenresService _genresService;

  MoviesController({
    required GenresService genresService,
  }) : _genresService = genresService;
}
