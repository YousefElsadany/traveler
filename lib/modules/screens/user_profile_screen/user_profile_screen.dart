import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/modules/screens/Auth/login_screen/login_screen.dart';
import 'package:traveller/modules/screens/reset_change_password/change_password%20.dart';
import 'package:traveller/shared/local_storage_service.dart';
import 'package:traveller/shared/main_cubit/main_cubit.dart';
import '../../../shared/componants/componants.dart';
import '../../../shared/style/colors.dart';
import '../../widgets/show_localization_dialog.dart';
import 'edit_profile_screen/edit_profile_screen.dart';
import 'user_cubit/user_cubit.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context)
        .getData(LocalStorageService.getData(key: 'userId'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLogoutSuccess) {
            Get.snackbar('Logout', 'Logout Successful',
                backgroundColor: Colors.white, colorText: Colors.black);
            LocalStorageService.removeData(key: 'login');
            LocalStorageService.removeData(key: 'userId');
            Get.offAll(LoginScreen());
          }
        },
        builder: (context, state) {
          if (state is UserGetDataLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserGetDataSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: primaryColor,
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          children: [
                            Text(
                              state.model.name!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              state.model.email!,
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
                            Get.to(EditProfileScreen(
                              model: state.model,
                            ));
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
                        color: MainCubit.get(context).isDarke
                            ? Colors.white
                            : itemsColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          buildThings(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icons.home_outlined,
                            text: 'Home'.tr,
                          ),
                          customLine(margin: 12.0),
                          buildThings(
                            onPressed: () {
                              MainCubit.get(context).changeMode();
                            },
                            icon: MainCubit.get(context).isDarke
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            text: MainCubit.get(context).isDarke
                                ? 'Light Mode'.tr
                                : 'Dark Mode'.tr,
                          ),
                          customLine(margin: 12.0),
                          buildThings(
                            onPressed: () {
                              showLocalizationBottomSheet(
                                context,
                                isSplash: false,
                              );
                            },
                            icon: Icons.language,
                            text: 'Language'.tr,
                          ),
                          customLine(margin: 12.0),
                          buildThings(
                            onPressed: () {
                              Get.to(CHangePasswordScreen());
                            },
                            icon: Icons.lock,
                            text: 'Change Password'.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<UserCubit>(context).logout();
                    },
                    child: Text(
                      'LOGOUT'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
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
              color: MainCubit.get(context).isDarke
                  ? const Color(0xff727C8E)
                  : Colors.white,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
