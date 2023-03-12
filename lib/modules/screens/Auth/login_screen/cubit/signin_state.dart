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

class SendResetPassLoading extends SigninState {}

class SendResetPassLoaded extends SigninState {
  final String message;

  SendResetPassLoaded(this.message);
}

class SendResetPassError extends SigninState {
  final String error;

  SendResetPassError(this.error);
}

class SendResetPassRequestLoading extends SigninState {}

class SendResetPassRequestLoaded extends SigninState {
  final String message;

  SendResetPassRequestLoaded(this.message);
}

class SendResetPassRequestError extends SigninState {
  final String error;

  SendResetPassRequestError(this.error);
}
