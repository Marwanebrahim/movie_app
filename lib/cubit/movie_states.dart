import 'package:movie_app/models/movie.dart';

sealed class MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieLoadingState extends MovieStates {}

class MovieSuccessState extends MovieStates {
  final List<Movie> movies;
  MovieSuccessState({required this.movies});
}

class MovieErrorState extends MovieStates {
  final String errorMessage;
  MovieErrorState({required this.errorMessage});
}


