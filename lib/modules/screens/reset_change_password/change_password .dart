import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../shared/main_cubit/main_cubit.dart';
import '../user_profile_screen/user_cubit/user_cubit.dart';
import 'componant/reset_change_password_widget.dart';

class CHangePasswordScreen extends StatefulWidget {
  const CHangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CHangePasswordScreen> createState() => _CHangePasswordScreenState();
}

class _CHangePasswordScreenState extends State<CHangePasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        iconTheme: IconTheme.of(context).copyWith(
            color:
                MainCubit.get(context).isDarke ? Colors.black : Colors.white),
        elevation: 0.0,
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserChangePasswordSuccess) {
            Get.back();
            Get.snackbar('Change Password'.tr, state.message);
          }
          if (state is UserChangePasswordError) {
            Get.snackbar('Wrong'.tr, 'Something went wrong'.tr);
          }
        },
        child: ResetAndChangePassword(
          formKey: formKey,
          newPasswordController: newPasswordController,
          oldPasswordController: oldPasswordController,
          reNewPasswordController: reNewPasswordController,
          isChangePassword: true,
          submitPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<UserCubit>(context).changePassword(
                  currentPassword: oldPasswordController.text,
                  newPassword: newPasswordController.text);
            } else {}
          },
          title: 'Change Password'.tr,
        ),
      ),
    );
  }
}
