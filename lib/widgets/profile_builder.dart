import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/cubit/auth/user_state.dart';
import 'package:movie_app/styles/app_colors.dart';
import 'package:movie_app/styles/app_text_styles.dart';
import 'package:movie_app/widgets/profile_widget.dart';

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        if (state is UserAuthInitial) {
          return Container();
        }
        if (state is UserAuthLoggedIn) {
          return ProfileWidget(user: state.user);
        }
        if (state is UserAuthSuccess) {
          return ProfileWidget(user: state.user);
        }
        if (state is UserAuthFailure) {
          Text(
            state.errorMessage,
            style: AppTextStyles.bold30.copyWith(
              color: AppColors.whiteTextColor,
            ),
          );
        }
        return Text(
          state.toString(),
          style: AppTextStyles.bold30.copyWith(color: AppColors.whiteTextColor),
        );
      },
    );
  }
}
