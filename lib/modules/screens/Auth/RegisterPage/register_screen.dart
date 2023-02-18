import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:traveller/modules/screens/Auth/nationality_screen/nationality_screen.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var birthdateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  int? gender;
  late String genderValue = genderItems[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sign Up'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Name'.tr,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    // color: Color(0xff929292),
                                  ),
                                ),
                                customTextFeild(
                                  controller: nameController,
                                  inputType: TextInputType.name,
                                  title: 'Mohamed',
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name Required'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Email'.tr,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    // color:  Color(0xff929292),
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
                                  height: 20.0,
                                ),
                                TextField(
                                  controller: birthdateController,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      labelText: 'Birthdate'.tr),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        birthdateController.text =
                                            formattedDate;
                                      });
                                    } else {}
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Gender'.tr,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    // color: Color(0xff929292),
                                  ),
                                ),
                                DropdownButton(
                                  value: genderValue,
                                  isExpanded: true,
                                  underline: Divider(
                                    color: Colors.black,
                                  ),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: genderItems.map((String items) {
                                    return buildMenuItem(context, items);
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      genderValue = newValue!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Password'.tr,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    // color: Color(0xff929292),
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
                                      return 'Password less than 6 charchtar'
                                          .tr;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            customButtom(
                                buttomColor: primaryColor,
                                buttomWidth: double.infinity,
                                text: 'Next'.tr,
                                press: () {
                                  if (formKey.currentState!.validate()) {
                                    Get.to(CountriesScreen());
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
