import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:traveller/layout/layout_screen.dart';
import 'package:traveller/model/login_model.dart';
import 'package:traveller/modules/screens/user_profile_screen/user_cubit/user_cubit.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';
import '../../../../shared/local_storage_service.dart';
import '../../../../shared/main_cubit/main_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel model;

  const EditProfileScreen({super.key, required this.model});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController birthdateController;
  late TextEditingController emailController;
  late String genderValue;
  @override
  void initState() {
    super.initState();
    var dateTime = DateTime.parse(widget.model.date!);
    var day = dateTime.day < 10 ? "0${dateTime.day}" : "${dateTime.day}";
    var month =
        dateTime.month < 10 ? "0${dateTime.month}" : "${dateTime.month}";
    nameController = TextEditingController(text: widget.model.name);
    birthdateController =
        TextEditingController(text: '${dateTime.year}-$month-$day');
    emailController = TextEditingController(text: widget.model.email);
    genderValue = widget.model.gender!;
  }

  @override
  Widget build(BuildContext context) {
    print(LocalStorageService.getData(key: 'login').toString());
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserEditError) {
          Get.snackbar('Wrong'.tr, 'Something went wrong'.tr,
              backgroundColor:
                  !MainCubit.get(context).isDarke ? Colors.black : Colors.white,
              colorText:
                  MainCubit.get(context).isDarke ? Colors.black : Colors.white);
        }
      },
      builder: (context, state) {
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
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (nameController.text != widget.model.name) {
                      BlocProvider.of<UserCubit>(context).editProfile(
                          url: 'update-name',
                          key: "name",
                          value: nameController.text);
                    }
                    if (emailController.text != widget.model.email) {
                      BlocProvider.of<UserCubit>(context).editProfile(
                          url: 'update-email',
                          key: "email",
                          value: emailController.text);
                    }
                    if (birthdateController.text != widget.model.date) {
                      BlocProvider.of<UserCubit>(context).editProfile(
                          url: 'update-date-of-birth',
                          key: "date",
                          value: birthdateController.text);
                    }
                    if (genderValue != widget.model.gender) {
                      BlocProvider.of<UserCubit>(context).editProfile(
                          url: 'update-gender',
                          key: "gender",
                          value: genderValue);
                    }
                    Get.back();
                    Get.snackbar('Edit'.tr, 'Edit Successful'.tr,
                        backgroundColor: !MainCubit.get(context).isDarke
                            ? Colors.black
                            : Colors.white,
                        colorText: MainCubit.get(context).isDarke
                            ? Colors.black
                            : Colors.white);
                  },
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
                      color: MainCubit.get(context).isDarke
                          ? Colors.white
                          : itemsColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildEditFeild(
                          context,
                          text: 'Name'.tr,
                          controller: nameController,
                          inputType: TextInputType.name,
                          pIcon: Icons.person_outline,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        buildEditFeild(
                          context,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14),
                          decoration: InputDecoration(
                            icon: const Icon(Icons.calendar_today),
                            labelText: 'Birthdate'.tr,
                            labelStyle: TextStyle(color: Colors.grey[500]),
                          ),
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DropdownButton(
                          value: genderValue,
                          isExpanded: true,
                          dropdownColor: !MainCubit.get(context).isDarke
                              ? Colors.black
                              : Colors.white,
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
      },
    );
  }
}

Widget buildEditFeild(
  context, {
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
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        customTextFeild(
          context,
          controller: controller,
          inputType: inputType,
          title: '',
          pIcon: pIcon,
          textColor: Colors.black,
        )
      ],
    );
