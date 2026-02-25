import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/cubit/movie_states.dart';
import 'package:movie_app/widgets/movie_grid.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MovieErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is MovieSuccessState) {
          return MovieGrid(movies: state.movies);
        }
        return const Text('No movies found');
      },
    );
  }
}
