import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';

class ResetAndChangePassword extends StatefulWidget {
  final bool isChangePassword;
  final submitPressed;
  final String title;
  final formKey;
  var oldPasswordController;
  var newPasswordController;
  var reNewPasswordController;
  ResetAndChangePassword({
    Key? key,
    required this.isChangePassword,
    required this.title,
    required this.submitPressed,
    required this.formKey,
    this.oldPasswordController,
    required this.newPasswordController,
    required this.reNewPasswordController,
  }) : super(key: key);

  @override
  _ResetAndChangePasswordState createState() => _ResetAndChangePasswordState();
}

class _ResetAndChangePasswordState extends State<ResetAndChangePassword> {
  bool _isShow = true;

  void _changePasswordIcon() {
    setState(() {
      _isShow = !_isShow;
      _suffinx =
          _isShow ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    });
  }

  IconData _suffinx = Icons.visibility_off_outlined;

  _snackBar(text) => SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 25,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              widget.isChangePassword == false
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Old Password'.tr,
                          style: Theme.of(context).textTheme.bodyText1!
                            ..copyWith(
                                fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        customTextFeild(
                          context,
                          controller: widget.oldPasswordController,
                          inputType: TextInputType.visiblePassword,
                          title: 'Old Password'.tr,
                          pIcon: Icons.lock,
                          isPassword: _isShow,
                          sIcon: _suffinx,
                          suffixPress: () {
                            _changePasswordIcon();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Old password is requird'.tr;
                            } else if (value.length < 6) {
                              return 'Old password less than 6 chars'.tr;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
              Text(
                'New Password'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              customTextFeild(
                context,
                controller: widget.newPasswordController,
                inputType: TextInputType.visiblePassword,
                title: 'New Password'.tr,
                pIcon: Icons.lock,
                isPassword: _isShow,
                sIcon: _suffinx,
                suffixPress: () {
                  _changePasswordIcon();
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'New password is requird'.tr;
                  } else if (value.length < 6) {
                    return 'New password less than 6 chars'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Re-New Password'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              customTextFeild(
                context,
                controller: widget.reNewPasswordController,
                inputType: TextInputType.visiblePassword,
                title: 'Re-New Password'.tr,
                pIcon: Icons.lock,
                isPassword: _isShow,
                sIcon: _suffinx,
                suffixPress: () {
                  _changePasswordIcon();
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Re-new password is requird'.tr;
                  } else if (value != widget.newPasswordController.text) {
                    return 'Passwords is not match'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customButtom(
                    buttomColor: primaryColor,
                    buttomWidth: double.infinity,
                    text: 'Submit'.tr,
                    press: widget.submitPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
