import 'package:flutter/material.dart';

import '../../../../shared/main_cubit/main_cubit.dart';
import '../../../../shared/style/colors.dart';

Widget mostPopularItem(context, item) {
  return Container(
    height: 200,
    width: 180,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MainCubit.get(context).isDarke ? Colors.white : itemsColor,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, offset: Offset(0.0, 4.0), blurRadius: 10.0)
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 140,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(item.imgurl), fit: BoxFit.cover)),
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
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, top: 5),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(
            item.location,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 7, top: 5, end: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Row(
                children: [
                  Text(
                    item.rating.toString(),
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
      ],
    ),
  );
}
