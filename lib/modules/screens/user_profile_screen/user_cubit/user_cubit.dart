import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:traveller/model/login_model.dart';
import 'package:traveller/shared/DioHelper.dart';
import 'package:traveller/shared/local_storage_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void logout() async {
    await DioHelper.postData(
            url: "auth/logout",
            data: {},
            token: LocalStorageService.getData(key: 'login'))
        .then((value) {
      emit(UserLogoutSuccess());
      log(value.data.toString());
    }).catchError((error) {
      emit(UserLogoutError());
      log(error.toString());
    });
  }

  void getData(var id) async {
    emit(UserGetDataLoading());
    await DioHelper.getData(
      url: "auth/users/$id",
    ).then((value) {
      var user = UserModel.fromJson(value.data);
      emit(UserGetDataSuccess(user));
      log(value.data.toString());
    }).catchError((error) {
      emit(UserGetDataError());
      log(error.toString());
    });
  }

  void editProfile({required url, required key, required value}) async {
    await DioHelper.patchData(
        url: "auth/$url",
        token: LocalStorageService.getData(key: 'login'),
        data: {
          key: value,
        }).then((value) {
      emit(UserEditSuccess());
      log(value.data.toString());
      getData(LocalStorageService.getData(key: 'userId'));
    }).catchError((error) {
      emit(UserEditError());
      log(error.toString());
      getData(LocalStorageService.getData(key: 'userId'));
    });
  }

  void changePassword({required currentPassword, required newPassword}) async {
    emit(UserChangePasswordLoading());
    await DioHelper.patchData(
        url: "auth/update-password",
        token: LocalStorageService.getData(key: 'login'),
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
        }).then((value) {
      emit(UserChangePasswordSuccess(value.data['message']));
      log(value.data.toString());
      getData(LocalStorageService.getData(key: 'userId'));
    }).catchError((error) {
      emit(UserChangePasswordError());
      log(error.toString());
      getData(LocalStorageService.getData(key: 'userId'));
    });
  }
}
