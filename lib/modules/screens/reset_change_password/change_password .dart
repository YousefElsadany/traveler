import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../../shared/main_cubit/main_cubit.dart';
import 'componant/reset_change_password_widget.dart';

class CHangePasswordScreen extends StatefulWidget {
  const CHangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CHangePasswordScreen> createState() => _CHangePasswordScreenState();
}

class _CHangePasswordScreenState extends State<CHangePasswordScreen> {
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
      body: ResetAndChangePassword(
        isChangePassword: true,
        submitPressed: () {},
        title: 'Change Password',
      ),
    );
  }
}
