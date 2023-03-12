import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:traveller/model/login_model.dart';
import 'package:traveller/shared/DioHelper.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> signin({required String email, required String password}) async {
    emit(SigninLoading());

    await DioHelper.postData(url: 'auth/login', data: {
      "email": email,
      "password": password,
    }).then((value) {
      var login = LoginModel.fromJson(value.data);
      emit(SigninLoaded(login));
      print(login.message);
    }).catchError((error) {
      emit(SigninError(error.toString()));
      print(error.toString());
    });
  }
}
