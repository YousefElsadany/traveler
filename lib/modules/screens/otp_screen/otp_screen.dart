import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveller/modules/screens/reset_change_password/reset_password.dart';
import 'package:traveller/shared/componants/componants.dart';

import '../../../shared/main_cubit/main_cubit.dart';
import '../../../shared/style/colors.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    Key? key,
    required this.email,
    required this.message,
  }) : super(key: key);

  final email;
  final String message;
  late String otpCode;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Password reset OTP sent to your email'.tr,
                    style: Theme.of(context).textTheme.bodyText1!,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' $email',
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                buildPinCodeFields(context),
                const SizedBox(height: 50),
                customButtom(
                  buttomWidth: double.infinity,
                  buttomColor: primaryColor,
                  text: 'Verify'.tr,
                  press: () {
                    Get.to(ResetPasswordScreen(
                      otp: otpCode,
                      email: email,
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPinCodeFields(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: PinCodeTextField(
          appContext: context,
          autoFocus: true,
          cursorColor: primaryColor,
          keyboardType: TextInputType.number,
          length: 6,
          obscureText: false,
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 40,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: primaryColor,
            inactiveColor: primaryColor,
            inactiveFillColor: Colors.white,
            activeFillColor: fullBackgroundColor,
            selectedColor: primaryColor,
            selectedFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          onCompleted: (submitedCode) {
            otpCode = submitedCode;
          },
          onChanged: (value) {},
        ),
      ),
    );
  }
}
