import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/places_model.dart';
import '../../../../shared/style/colors.dart';
import 'item_details_screen.dart';

class BestVisits extends StatelessWidget {
  final hotel = PlacesModel.bestVisitList();

  BestVisits({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(
                height: 10,
              ),
          itemCount: hotel.length,
          itemBuilder: (context, index) {
            PlacesModel hotelscreen = hotel[index];
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsScreen(
                    hotel: hotelscreen,
                  ),
                );
              },
              child: Container(
                height: 110,
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(end: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 8.0)
                    ]),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 110,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(hotel[index].imgurl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: fullBackgroundColor,
                            radius: 15,
                            child: Icon(
                              Icons.favorite_border,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hotel[index].title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          hotel[index].location,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          hotel[index].rating.toString(),
                          style: TextStyle(color: primaryColor),
                        ),
                        const Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 12,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
