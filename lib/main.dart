import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/layout/layout_screen.dart';
import 'package:traveller/modules/screens/Auth/RegisterPage/cubit/signup_cubit.dart';
import 'package:traveller/modules/screens/Auth/login_screen/cubit/signin_cubit.dart';
import 'package:traveller/modules/screens/Auth/login_screen/login_screen.dart';
import 'package:traveller/modules/screens/user_profile_screen/user_cubit/user_cubit.dart';
import 'package:traveller/shared/DioHelper.dart';
import 'package:traveller/shared/local_storage_service.dart';
import 'package:traveller/shared/main_cubit/main_cubit.dart';
import 'package:traveller/shared/style/Themes.dart';

import 'modules/widgets/show_localization_dialog.dart';
import 'shared/localization/localization_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await LocalStorageService.init();
  late bool? isDark = LocalStorageService.getData(key: 'isDark');

  Future.delayed(Duration(seconds: 2));
  runApp(MyApp(
    isDark: (isDark != null) ? isDark : false,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()..changeMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => SigninCubit(),
        ),
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Traveller',
            theme: lightMode,
            darkTheme: darkMode,
            locale: LocalizationService().getCurrentLocate(),
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            debugShowCheckedModeBanner: false,
            themeMode: !MainCubit.get(context).isDarke
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const splashScreen(),
          );
        },
      ),
    );
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );

        showLocalizationBottomSheet(
          context,
          isSplash: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: const Center(
          child: Text(
            'Traveller',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
