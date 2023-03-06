import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/places_model.dart';
import '../../../../shared/main_cubit/main_cubit.dart';
import '../../../../shared/style/colors.dart';
import 'item_details_screen.dart';

class BestVisits extends StatelessWidget {
  final items = PlacesModel.bestVisitList();

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
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsScreen(
                    item: items[index],
                  ),
                );
              },
              child: Container(
                height: 110,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(end: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MainCubit.get(context).isDarke
                        ? Colors.white
                        : itemsColor,
                    boxShadow: const [
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
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(items[index].imgurl),
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
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          items[index].title,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          items[index].location,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          items[index].rating.toString(),
                          style: const TextStyle(color: primaryColor),
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
