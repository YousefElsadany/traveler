import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:traveller/layout/layout_screen.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../../shared/componants/componants.dart';
import '../../../../shared/local_storage_service.dart';

class CountriesScreen extends StatefulWidget {
  final userId;
  const CountriesScreen({super.key, required this.userId});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

enum UserType { egyptian, english }

class _CountriesScreenState extends State<CountriesScreen> {
  UserType? _character = UserType.english;
  int? item;
  late String itemValue = governorates[0];
  late String tourismValue = tourismType[0];
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
          icon: const Icon(
            Icons.arrow_back_ios,
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User Nationality'.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Are you egyptian?'.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              ),
                              RadioListTile<UserType>(
                                title: Text('No'.tr),
                                value: UserType.english,
                                groupValue: _character,
                                onChanged: (UserType? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              RadioListTile<UserType>(
                                title: Text('Egyptian'.tr),
                                value: UserType.egyptian,
                                groupValue: _character,
                                onChanged: (UserType? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              if (_character == UserType.egyptian)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Governorates'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    DropdownButton(
                                      value: itemValue,
                                      borderRadius: BorderRadius.circular(15),
                                      isExpanded: true,
                                      underline: Divider(
                                        color: Colors.black,
                                      ),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: governorates.map((String items) {
                                        return buildMenuItem(context, items);
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          itemValue = newValue!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Tourism Type'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                            ),
                          ),
                          DropdownButton(
                            value: tourismValue,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(15),
                            underline: Divider(
                              color: Colors.black,
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: tourismType.map((String items) {
                              return buildMenuItem(context, items);
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                tourismValue = newValue!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          customButtom(
                              buttomColor: primaryColor,
                              buttomWidth: double.infinity,
                              text: 'Sign Up'.tr,
                              press: () {
                                LocalStorageService.saveData(
                                    key: 'login', value: widget.userId);
                                Get.offAll(LayoutScreen());
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
    );
  }
}
