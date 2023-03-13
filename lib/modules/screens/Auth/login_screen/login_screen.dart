// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/layout/layout_screen.dart';
import 'package:traveller/modules/screens/Auth/login_screen/cubit/signin_cubit.dart';
import 'package:traveller/shared/local_storage_service.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';
import '../../../../shared/main_cubit/main_cubit.dart';
import 'componant/login_with_email_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => SigninCubit(),
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninLoaded) {
              Get.offAll(LayoutScreen());
              LocalStorageService.saveData(
                  key: 'login', value: state.model.token);
              LocalStorageService.saveData(
                  key: 'userId', value: state.model.data!.sId);
              LocalStorageService.putBool(key: 'isloged', value: true);

              Get.snackbar(
                'Login'.tr,
                'Login Successful'.tr,
                backgroundColor: !MainCubit.get(context).isDarke
                    ? Colors.black
                    : Colors.white,
                colorText: MainCubit.get(context).isDarke
                    ? Colors.black
                    : Colors.white,
              );
            }
            if (state is SigninError) {
              Get.snackbar('Wrong'.tr, 'Something went wrong'.tr,
                  backgroundColor: !MainCubit.get(context).isDarke
                      ? Colors.black
                      : Colors.white,
                  colorText: MainCubit.get(context).isDarke
                      ? Colors.black
                      : Colors.white);
            }
          },
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.jpg'),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          LoginWithEmailWidget(
                            emailController: emailController,
                            passwordController: passwordController,
                            formKey: formKey,
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          Text(
                            '-OR-'.tr,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          customButtom(
                              buttomColor: primaryColor,
                              buttomWidth: double.infinity,
                              text: 'Login as a guest'.tr,
                              press: () {
                                Get.offAll(LayoutScreen());
                                LocalStorageService.putBool(
                                    key: 'isloged', value: false);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
