import 'package:dio/dio.dart';
import 'package:movie_app/constants/api_constant.dart';

class MovieService {
 

  MovieService();

  Future<List<dynamic>> fetchPopularMovies(Dio dio) async {
    final response = await dio.get(
      "https://api.themoviedb.org/3/movie/popular",
      queryParameters: {
        'api_key': ApiConstant.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
    return response.data['results'];
  }
  
}
