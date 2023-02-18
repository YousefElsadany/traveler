import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/componants/componants.dart';
import '../../../../../shared/style/colors.dart';
import '../../RegisterPage/register_screen.dart';

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
          borderRadius: BorderRadius.circular(15), color: Colors.white),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                onPressed: () {},
                child: Text(
                  'Forget Password?'.tr,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color.fromARGB(190, 0, 0, 0),
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
                    // Get.offAll( ShopLayout());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
