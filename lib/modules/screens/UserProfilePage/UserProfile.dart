import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../shared/componants/componants.dart';
import '../../../shared/style/colors.dart';
import 'EditProfilePage/EditProfile.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fullBackgroundColor,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Eman',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'eman@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(EditProfileScreen());
                    },
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    buildThings(
                      onPressed: () {},
                      icon: Icons.home_outlined,
                      text: 'My Home',
                    ),
                    customLine(margin: 12.0),
                    buildThings(
                      onPressed: () {},
                      icon: Icons.location_on_outlined,
                      text: 'Adderess',
                    ),
                    customLine(margin: 12.0),
                    buildThings(
                      onPressed: () {},
                      icon: Icons.format_list_bulleted,
                      text: 'All My Orders',
                    ),
                    customLine(margin: 12.0),
                    buildThings(
                      onPressed: () {},
                      icon: Icons.lock_outlined,
                      text: 'Change Password',
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'LOGOUT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThings({
    required onPressed,
    required IconData icon,
    required String text,
  }) =>
      InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff727C8E),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff515C6F),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      );
}
