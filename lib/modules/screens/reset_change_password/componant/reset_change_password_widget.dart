import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';

class ResetAndChangePassword extends StatefulWidget {
  final bool isChangePassword;
  final submitPressed;
  final String title;
  const ResetAndChangePassword({
    Key? key,
    required this.isChangePassword,
    required this.title,
    required this.submitPressed,
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
  var formKey = GlobalKey<FormState>();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();
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
          key: formKey,
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
                          controller: oldPasswordController,
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
                            } else if (value.length < 6) {}
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
                controller: newPasswordController,
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
                  } else if (value.length < 6) {}
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
                controller: reNewPasswordController,
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
                  } else if (value.length < 6) {}
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
                    press:
                        //  () {
                        //   if (formKey.currentState!.validate()) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text('Processing Data')));
                        //   } else {
                        //     Vibration.vibrate(duration: 300);
                        //   }
                        // },
                        widget.submitPressed,
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
