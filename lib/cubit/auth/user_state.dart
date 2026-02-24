import 'package:movie_app/models/user.dart';

sealed class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserAuthLoggedIn extends UserAuthState {
  final User user;
  UserAuthLoggedIn({required this.user});
}

class UserLoggedOut extends UserAuthState {}

class UserAuthFailure extends UserAuthState {
  final String errorMessage;
  UserAuthFailure({required this.errorMessage});
}

class UserAuthSuccess extends UserAuthState {
  final User user;
  UserAuthSuccess({required this.user});
}
