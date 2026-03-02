import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/movie.dart';

class FavoriteMovieService {
  final String _boxName = "favoriteMovie";
  List<Movie> getFavoriteMovies() {
    try {
      final favMovies = Hive.box(_boxName).values
          .map((e) => Movie.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return favMovies;
    } catch (e) {
      return [];
    }
  }

  Future<Movie?> addMovieToFavorite(Movie movie) async {
    try {
      await Hive.box(_boxName).put(movie.id, movie.toMap());
      return movie;
    } catch (e) {
      return null;
    }
  }

  Future<bool> removeFromFavoriteList(Movie movie) async {
    try {
      await Hive.box(_boxName).delete(movie.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
