import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/movie.dart';

class FavoriteMovieService {
  final String _collectionName = "favoriteMovie";
  final db = FirebaseFirestore.instance;
  final userEmail = Hive.box("currentUser").get("currentUser");
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      if (userEmail == null) return [];
      final favMovies = await db
          .collection(_collectionName)
          .doc(userEmail)
          .collection("movies")
          .get();
      return favMovies.docs
          .map((e) => Movie.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<Movie?> addMovieToFavorite(Movie movie) async {
    try {
      if (userEmail == null) return null;

      await db
          .collection(_collectionName)
          .doc(userEmail)
          .collection("movies")
          .doc(movie.id.toString())
          .set(movie.toMap());
      return movie;
    } catch (e) {
      return null;
    }
  }

  Future<bool> removeFromFavoriteList(Movie movie) async {
    try {
      await db
          .collection(_collectionName)
          .doc(userEmail)
          .collection("movies")
          .doc(movie.id.toString())
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
