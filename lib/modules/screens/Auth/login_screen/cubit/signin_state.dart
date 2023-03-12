part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninLoaded extends SigninState {
  final LoginModel model;

  SigninLoaded(this.model);
}

class SigninError extends SigninState {
  final String error;

  SigninError(this.error);
}
