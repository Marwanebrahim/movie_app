import 'package:movie_app/models/movie.dart';

sealed class FavouriteState {}

class FavouriteIntialState extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<Movie> favoriteMovies;

  FavouriteLoaded({required this.favoriteMovies});
}

class FavouriteErrorState extends FavouriteState {
  final String errorMessage;

  FavouriteErrorState({required this.errorMessage});
}
