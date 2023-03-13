import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/modules/screens/otp_screen/otp_screen.dart';
import 'package:traveller/shared/componants/componants.dart';

import '../../../shared/main_cubit/main_cubit.dart';
import '../../../shared/style/colors.dart';
import '../Auth/login_screen/cubit/signin_cubit.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});
  TextEditingController emailController = TextEditingController();
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
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SendResetPassLoaded) {
            Get.to(OtpScreen(
              email: emailController.text,
              message: state.message,
            ));
          }
          if (state is SendResetPassError) {
            Get.snackbar('Wrong'.tr, 'Something went wrong'.tr);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Enter your email address'.tr,
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                    const SizedBox(height: 30),
                    customTextFeild(
                      context,
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      title: 'Email'.tr,
                    ),
                    const SizedBox(height: 50),
                    state is SendResetPassLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : customButtom(
                            buttomWidth: double.infinity,
                            buttomColor: primaryColor,
                            text: 'Next'.tr,
                            press: () {
                              BlocProvider.of<SigninCubit>(context)
                                  .sentResetPasswordRequest(
                                      email: emailController.text);
                            },
                          ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
