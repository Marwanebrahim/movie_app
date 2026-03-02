import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/favourite/favourite_state.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/favorite_movie_service.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteIntialState());
  final FavoriteMovieService favoriteMovieService = .new();

  void getFavoriteMovies() {
    emit(FavouriteLoading());
    try {
      final movies = favoriteMovieService.getFavoriteMovies();
      emit(FavouriteLoaded(favoriteMovies: movies));
    } catch (e) {
      emit(FavouriteErrorState(errorMessage: "failed to get movies"));
    }
  }

  void addToFavorites(Movie movie) async {
    final result = await favoriteMovieService.addMovieToFavorite(movie);
    if (result != null) {
      getFavoriteMovies();
    }
  }

  void removeFromFavorite(Movie movie) async {
    final deleted = await favoriteMovieService.removeFromFavoriteList(movie);
    if (deleted) {
      getFavoriteMovies();
    }
  }
}
