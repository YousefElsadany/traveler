import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/modules/screens/Auth/login_screen/cubit/signin_cubit.dart';
import 'package:traveller/modules/screens/Auth/login_screen/login_screen.dart';
import 'package:traveller/shared/style/colors.dart';
import '../../../shared/main_cubit/main_cubit.dart';
import 'componant/reset_change_password_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  final otp;
  final email;
  const ResetPasswordScreen({Key? key, this.otp, this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var formKey = GlobalKey<FormState>();
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
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SendResetPassRequestLoaded) {
            Get.offAll(LoginScreen());
            Get.snackbar('Reset Password', state.message);
          }
          if (state is SendResetPassRequestError) {
            Get.snackbar('Wrong'.tr, 'Something went wrong'.tr);
          }
        },
        child: ResetAndChangePassword(
          formKey: formKey,
          newPasswordController: newPasswordController,
          reNewPasswordController: reNewPasswordController,
          isChangePassword: false,
          submitPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<SigninCubit>(context).sentResetPassword(
                email: widget.email,
                otp: widget.otp,
                password: newPasswordController.text,
              );
            } else {}
          },
          title: 'Reset Password',
        ),
      ),
    );
  }
}
