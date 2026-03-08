import 'package:dio/dio.dart';
import 'package:movie_app/constants/api_constant.dart';
import 'package:movie_app/models/movie.dart';

class SearchService {
  Future<List<Movie>?> searchMovies(Dio dio, String query) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/search/movie",
        queryParameters: {
          'api_key': ApiConstant.apiKey,
          'language': 'en-US',
          'query': query,
          'page': 1,
        },
      );
      final List<Movie> movies = (response.data['results'] as List)
          .map((e) => Movie.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return movies;
    } catch (e) {
      return null;
    }
  }
}
