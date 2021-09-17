import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';

    
  }
}