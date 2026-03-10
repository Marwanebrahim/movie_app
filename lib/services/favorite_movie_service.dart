import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/models/movie.dart';

class FavoriteMovieService {
  final String _collectionName = "favoriteMovie";
  final db = FirebaseFirestore.instance;

  String? getUserEmail() {
    final user = FirebaseAuth.instance.currentUser?.email;
    return user;
  }

  Future<List<Movie>> getFavoriteMovies() async {
    final userEmail = getUserEmail();

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
    final userEmail = getUserEmail();
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
    final userEmail = getUserEmail();
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
