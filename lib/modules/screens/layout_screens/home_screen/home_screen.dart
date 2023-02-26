import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveller/model/places_model.dart';
import 'package:traveller/modules/screens/UserProfilePage/UserProfile.dart';
import 'package:traveller/modules/screens/layout_screens/home_screen/most_popular.dart';
import 'package:traveller/shared/style/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'item_details_screen.dart';
import 'best_visits.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
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
                  children: const [
                    Text("Hello!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Find Your Place",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(UserProfileScreen());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey.shade500,
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
                  "Most Popular",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.length,
                      separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                      itemBuilder: (context, index) {
                        PlacesModel hotelscreen = item[index];

                        return InkWell(
                          onTap: () {
                            Get.to(
                              DetailsScreen(
                                hotel: hotelscreen,
                              ),
                            );
                          },
                          child: mostPopularItem(hotelscreen),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Best Visits',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
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
