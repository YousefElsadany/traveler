import 'package:flutter/material.dart';
import 'package:traveller/model/places_model.dart';

class DetailsScreen extends StatefulWidget {
  final PlacesModel hotel;

  DetailsScreen({required this.hotel});

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
                  image: AssetImage(widget.hotel.imgurl),
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
                          Icons.arrow_back_ios,
                          size: 15,
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
                  widget.hotel.title,
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.hotel.location,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.hotel.description),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reviews',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(widget.hotel.rating.toString()),
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
