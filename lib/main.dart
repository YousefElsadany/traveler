import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveller/modules/screens/Auth/login_screen/login_screen.dart';
import 'package:traveller/shared/local_storage_service.dart';
import 'package:traveller/shared/style/Themes.dart';

import 'modules/widgets/show_localization_dialog.dart';
import 'shared/localization/localization_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.init();
  Future.delayed(Duration(seconds: 2));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Traveller',
      theme: lightMode,
      locale: LocalizationService().getCurrentLocate(),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const splashScreen(),
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
