import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies/application/rest_client/rest_client.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/repositories/movies/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result =
        await _restClient.get<List<MovieModel>>('/movie/popular', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1',
    }, decoder: (data) {
      final resultData = data['results'];
      if (resultData != null) {
        return resultData
            .map<MovieModel>((v) => MovieModel.fromMap(v))
            .toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      //print(result.statusText);
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result =
        await _restClient.get<List<MovieModel>>('/movie/top_rated', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1',
    }, decoder: (data) {
      final resultData = data['results'];
      if (resultData != null) {
        return resultData
            .map<MovieModel>((v) => MovieModel.fromMap(v))
            .toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar top rated movies [${result.statusText}]');
      //print(result.statusText);
      throw Exception('Erro ao buscar os top rated filmes');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result =
        await _restClient.get<MovieDetailModel?>('/movie/$id', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'append_to_response': 'images,credits',
      'include_image_language': 'en,pt-br',
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });
    if (result.hasError) {
      print('Erro ao buscar detalhes do filme [${result.statusText}]');
      //print(result.statusText);
      throw Exception('Erro ao buscar detalhes do filme');
    }
    return result.body; //?? <MovieDetailModel>[]; pois ele ja retorna como opcional o MovieDetailModel?.
  }
}
