import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_states.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/favorite_movie_service.dart';
import 'package:movie_app/services/movie_service.dart';

class MovieCubit extends Cubit<MovieStates> {
  final MovieService movieService = .new();
  List<Movie> _movies = [];
  MovieCubit() : super(MovieInitialState());
  final FavoriteMovieService favoriteMovieService = .new();
  void fetchMovies({required Dio dio}) async {
    emit(MovieLoadingState());
    try {
      final moviesData = await movieService.fetchPopularMovies(dio);
      _movies = moviesData!
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();

      emit(MovieSuccessState(movies: _movies));
    } catch (e) {
      emit(MovieErrorState(errorMessage: e.toString()));
    }
  }
}
