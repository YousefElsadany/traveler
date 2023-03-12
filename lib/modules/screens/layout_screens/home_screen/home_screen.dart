import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveller/model/places_model.dart';
import 'package:traveller/modules/screens/Auth/login_screen/login_screen.dart';
import 'package:traveller/modules/screens/user_profile_screen/user_profile_screen.dart';
import 'package:traveller/modules/screens/layout_screens/home_screen/most_popular.dart';
import 'package:traveller/shared/local_storage_service.dart';
import 'package:traveller/shared/main_cubit/main_cubit.dart';
import 'package:traveller/shared/style/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'item_details_screen.dart';
import 'best_visits.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var item = PlacesModel.mostPopularList();
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'BboLnPslLJw',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log(LocalStorageService.getData(key: 'isloged').toString());
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!".tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Find Your Place".tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (LocalStorageService.getData(key: 'isloged') == true) {
                      Get.to(const UserProfileScreen());
                    } else {
                      Get.to(const LoginScreen());
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: MainCubit.get(context).isDarke
                          ? Colors.white
                          : itemsColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: MainCubit.get(context).isDarke
                          ? Colors.grey.shade500
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Popular".tr,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              DetailsScreen(
                                item: item[index],
                              ),
                            );
                          },
                          child: mostPopularItem(context, item[index]),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Best Visits'.tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BestVisits(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
