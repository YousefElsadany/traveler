import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/shared/componants/componants.dart';

import '../../../shared/main_cubit/main_cubit.dart';
import '../../../shared/style/colors.dart';

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
              Icons.arrow_back_ios_new,
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
                Text(
                  'Enter Email Address'.tr,
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
                const SizedBox(height: 30),
                customTextFeild(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  title: 'email'.tr,
                ),
                const SizedBox(height: 50),
                customButtom(
                  buttomWidth: double.infinity,
                  buttomColor: primaryColor,
                  text: 'Next'.tr,
                  press: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
