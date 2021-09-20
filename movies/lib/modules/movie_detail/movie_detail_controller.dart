import 'package:get/get.dart';

import 'package:movies/application/ui/loader/loader_mixin.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/services/movies/movies_service.dart';

class MoveiDetailController extends GetxController
    with LoaderMixin, MaessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MoveiDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      movie(movieDetailData);
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar detalhes do filme'));
    }
  }
}
