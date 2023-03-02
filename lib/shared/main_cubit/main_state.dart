part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class LoadingChooseLangState extends MainState {}

class SuccessChooseLangState extends MainState {}

class AppChangeMode extends MainState {}
