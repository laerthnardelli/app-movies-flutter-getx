import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/application/modules/module.dart';
import 'package:movies/modules/movie_detail/movie_detail_bindings.dart';

import 'package:movies/modules/movie_detail/movie_detail_page.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),
  ];
}
