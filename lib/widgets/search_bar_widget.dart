import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/search/search_cubit.dart';
import 'package:movie_app/cubit/search/search_state.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearchChanged,
  });
  final TextEditingController controller;
  final void Function(String) onSearchChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        style: AppTextStyles.regular16.copyWith(
          color: AppColors.whiteTextColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search movies...',
          hintStyle: AppTextStyles.regular16.copyWith(
            color: AppColors.grayTextColor,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.grayTextColor),
          suffixIcon: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return state is! SearchInitial
                  ? IconButton(
                      icon: Icon(Icons.clear, color: AppColors.grayTextColor),
                      onPressed: () {
                        controller.clear();
                        context.read<SearchCubit>().clearSearch();
                      },
                    )
                  : const SizedBox.shrink();
            },
          ),
          filled: true,
          fillColor: AppColors.appBarColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
