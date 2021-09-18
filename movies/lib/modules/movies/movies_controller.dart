import 'package:get/get.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/services/genres/genres_service.dart';

class MoviesController extends GetxController with MaessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  MoviesController({
    required GenresService genresService,
  }) : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar Categorias'));
    }
  }
}
