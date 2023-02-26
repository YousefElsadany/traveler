import 'package:flutter/material.dart';

import '../../../../shared/style/colors.dart';

Widget mostPopularItem(item) {
  return Container(
    height: 200,
    width: 180,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Text(
            item.title,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            item.location,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7, top: 5, right: 3),
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
