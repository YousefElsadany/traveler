part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLogoutSuccess extends UserState {}

class UserLogoutError extends UserState {}

class UserGetDataSuccess extends UserState {
  final UserModel model;

  UserGetDataSuccess(this.model);
}

class UserGetDataLoading extends UserState {}

class UserGetDataError extends UserState {}

class UserEditSuccess extends UserState {}

class UserEditError extends UserState {}

class UserChangePasswordLoading extends UserState {}

class UserChangePasswordSuccess extends UserState {
  final String message;

  UserChangePasswordSuccess(this.message);
}

class UserChangePasswordError extends UserState {}
