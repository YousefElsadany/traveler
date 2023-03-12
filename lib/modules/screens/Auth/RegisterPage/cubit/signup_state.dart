part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupLoaded extends SignupState {
  final LoginModel model;

  SignupLoaded(this.model);
}

class SignupError extends SignupState {
  final String error;

  SignupError(this.error);
}
