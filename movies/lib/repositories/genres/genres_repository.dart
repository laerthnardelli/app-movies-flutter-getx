import 'package:movies/models/genre_model.dart';

abstract class GenresRepository {

Future<List<GenreModel>> getGenres();

}