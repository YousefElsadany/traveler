import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/modules/screens/otp_screen/email_screen.dart';

import '../../../../../shared/componants/componants.dart';
import '../../../../../shared/main_cubit/main_cubit.dart';
import '../../../../../shared/style/colors.dart';
import '../../RegisterPage/register_screen.dart';
import '../cubit/signin_cubit.dart';

class LoginWithEmailWidget extends StatelessWidget {
  final emailController;
  final passwordController;
  final formKey;
  LoginWithEmailWidget(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MainCubit.get(context).isDarke ? Colors.white : itemsColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome,'.tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 30.0,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Sign Up'.tr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Sign in to Continue'.tr,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff929292),
                  ),
                ),
                SizedBox(
                  height: 38.0,
                ),
                Text(
                  'Email'.tr,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff929292),
                  ),
                ),
                customTextFeild(
                  context,
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  title: 'example@gmail.com',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email Required'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 38.0,
                ),
                Text(
                  'Password'.tr,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff929292),
                  ),
                ),
                customTextFeild(
                  context,
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword,
                  title: '●●●●●●●●●●●●',
                  isPassword: true,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password Required'.tr;
                    } else if (value.length < 6) {
                      return 'Password less than 6 charchtar'.tr;
                    }
                    return null;
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(EmailScreen());
                },
                child: Text(
                  'Forget Password?'.tr,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.0,
                      ),
                ),
              ),
            ),
            customButtom(
                buttomColor: primaryColor,
                buttomWidth: double.infinity,
                text: 'Login'.tr,
                press: () {
                  formKey.currentState!.save();
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SigninCubit>(context).signin(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
