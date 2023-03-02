import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traveller/model/places_model.dart';

class DetailsScreen extends StatefulWidget {
  final PlacesModel item;

  DetailsScreen({required this.item});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
                child: Image(
                  image: AssetImage(widget.item.imgurl),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 50,
                  left: 30,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Text(
                  widget.item.location,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.item.description),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reviews'.tr,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(widget.item.rating.toString()),
                        const Icon(Icons.star, size: 12, color: Colors.amber),
                        const Icon(Icons.star, size: 12, color: Colors.amber),
                        const Icon(Icons.star, size: 12, color: Colors.amber),
                        const Icon(Icons.star_half,
                            size: 12, color: Colors.amber),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
