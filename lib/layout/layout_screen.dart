import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/modules/screens/layout_screens/events_screen/events_screen.dart';
import 'package:traveller/modules/screens/layout_screens/home_screen/home_screen.dart';

import '../shared/style/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = [
    const HomePage(),
    const Center(
      child: Text('Favorite'),
    ),
    const EventsScreen(),
    const Center(
      child: Text('Settings'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        iconSize: 30,
        unselectedItemColor: Colors.grey.shade500,
        selectedItemColor: primaryColor,
        onTap: (index) {
          changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: 'Home'.tr),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite,
              ),
              label: 'Favorite'.tr),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.event,
              ),
              label: 'Events'.tr),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              label: 'Settings'.tr),
        ],
      ),
    );
  }
}
