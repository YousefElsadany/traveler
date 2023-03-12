import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:traveller/model/login_model.dart';
import 'package:traveller/shared/DioHelper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String date,
    required String gender,
  }) async {
    emit(SignupLoading());

    await DioHelper.postData(url: 'auth/signup', data: {
      "name": name,
      "email": email,
      "password": password,
      "date": date,
      "gender": gender
    }).then((value) {
      var signup = LoginModel.fromJson(value.data);
      emit(SignupLoaded(signup));
      print(signup.message);
    }).catchError((error) {
      emit(SignupError(error.toString()));
      print(error.toString());
    });
  }
}
