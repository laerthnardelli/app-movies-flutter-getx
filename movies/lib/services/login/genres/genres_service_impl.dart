import 'package:movies/models/genre_model.dart';
import 'package:movies/repositories/genres/genres_repository.dart';
import 'package:movies/services/login/genres/genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;
  
  GenresServiceImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres(); //proxy
}
