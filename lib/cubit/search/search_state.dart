// cubit/search/search_state.dart
import 'package:movie_app/models/movie.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;
  SearchLoaded({required this.movies});
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String errorMessage;
  SearchError({required this.errorMessage});
}
