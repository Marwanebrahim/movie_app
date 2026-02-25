import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/cubit/navigation%20bar/navigation_cubit.dart';

import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';

import 'navigation bar screens/favorites_screen.dart';
import 'navigation bar screens/home_screen.dart';
import 'navigation bar screens/profile_screen.dart';
import 'navigation bar screens/search_screen.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key});
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          title: Row(
            children: [
              SvgPicture.asset('assets/logo/logo.svg', height: 32),
              const SizedBox(width: 8),
              Text(
                'Movie Box',
                style: AppTextStyles.bold16.copyWith(
                  color: AppColors.whiteTextColor,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return IndexedStack(index: currentIndex, children: _screens);
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<NavigationCubit>().changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
