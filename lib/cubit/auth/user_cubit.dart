import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auth/user_state.dart';
import 'package:movie_app/services/user/user_auth_service.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit() : super(UserAuthInitial());

  Future<void> isUserLogged() async {
    emit(UserAuthLoading());
    try {
      final user = await UserAuthService().getCurrentUser();
      if (user != null) {
        emit(UserAuthLoggedIn(user: user));
      } else {
        emit(UserLoggedOut());
      }
    } catch (e) {
      emit(UserAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(UserAuthLoading());
    try {
      final user = await UserAuthService().addUser(
        name: name,
        email: email,
        password: password,
      );
      if (user != null) {
        emit(UserAuthSuccess(user: user));
      } else {
        emit(UserAuthFailure(errorMessage: "Failed to sign up"));
      }
    } catch (e) {
      emit(UserAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final user = await UserAuthService().getUser(
        email: email,
        password: password,
      );
      if (user != null) {
        emit(UserAuthSuccess(user: user));
      } else {
        emit(UserAuthFailure(errorMessage: "Invalid credentials"));
      }
    } catch (e) {
      emit(UserAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(UserAuthLoading());
    try {
      await UserAuthService().deleteCurrentUser();
      emit(UserAuthInitial());
    } catch (e) {
      emit(UserAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await UserAuthService().getCurrentUser();
      if (user != null) {
        emit(UserAuthLoggedIn(user: user));
      } else {
        emit(UserAuthFailure(errorMessage: "User not found"));
      }
    } catch (e) {
      emit(UserAuthFailure(errorMessage: e.toString()));
    }
  }
}
