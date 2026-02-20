import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_states.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';

class MovieCubit extends Cubit<MovieStates> {
  final Dio dio;
  final MovieService movieService = MovieService();
  MovieCubit({required this.dio}) : super(MovieInitialState());

  void fetchMovies() {
    emit(MovieLoadingState());
    try {
      final response = movieService.fetchPopularMovies(dio);
      response.then((moviesData) {
        List<Movie> movies = moviesData
            .map((movieJson) => Movie.fromJson(movieJson))
            .toList();
        emit(MovieSuccessState(movies: movies));
      });
    } catch (e) {
      emit(MovieErrorState(errorMessage: e.toString()));
    }
  }
}
