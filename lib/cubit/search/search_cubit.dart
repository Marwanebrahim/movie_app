// cubit/search/search_cubit.dart
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/search/search_state.dart';
import 'package:movie_app/services/favorite_movie_service.dart';
import 'package:movie_app/services/search_service.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService _searchService = .new();
  final FavoriteMovieService _favoriteService = FavoriteMovieService();

  SearchCubit() : super(SearchInitial());

  Future<void> searchMovies({required String query, required Dio dio}) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final movies = await _searchService.searchMovies(dio, query);

      if (movies == null || movies.isEmpty) {
        emit(SearchEmpty());
        return;
      }

      final favourites = await _favoriteService.getFavoriteMovies();

      for (var movie in movies) {
        movie.isFavorite = favourites.any((f) => f.id == movie.id);
      }

      emit(SearchLoaded(movies: movies));
    } catch (e) {
      emit(SearchError(errorMessage: e.toString()));
    }
  }

  void clearSearch() => emit(SearchInitial());
}
