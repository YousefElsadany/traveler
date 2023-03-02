import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController birthdateController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  int? gender;
  late String genderValue = genderItems[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile'.tr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'SAVE'.tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                color: primaryColor,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')),
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 18.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: primaryColor,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildEditFeild(
                      text: 'Name'.tr,
                      controller: nameController,
                      inputType: TextInputType.name,
                      pIcon: Icons.person_outline,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    buildEditFeild(
                      text: 'Email'.tr,
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      pIcon: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: birthdateController,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.calendar_today),
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
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            birthdateController.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Gender'.tr,
                      style: const TextStyle(
                        fontSize: 14.0,
                        // color: Color(0xff929292),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    DropdownButton(
                      value: genderValue,
                      isExpanded: true,
                      underline: const Divider(
                        color: Colors.black,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: genderItems.map((String items) {
                        return buildMenuItem(context, items);
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          genderValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildEditFeild({
  required String text,
  required TextEditingController controller,
  required TextInputType inputType,
  required IconData pIcon,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        customTextFeild(
          controller: controller,
          inputType: inputType,
          title: '',
          pIcon: pIcon,
          textColor: Colors.black,
        )
      ],
    );
