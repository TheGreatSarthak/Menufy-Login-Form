import 'package:flutter/material.dart';
import 'package:menufy_login_form/models/restaurant_item.dart';

// ignore: must_be_immutable
class RestaurantWidget extends StatelessWidget {
  //const RestaurantWidget({Key? key}) : super(key: key);

  String id;
  String imageUrl;
  String name;
  String type;
  Rating rating;

  RestaurantWidget(
      {super.key, required this.id,
      required this.imageUrl,
      required this.name,
      required this.rating,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(5)),
              ListTile(
                leading: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(type),
                  ],
                ),
                trailing: const Column(
                  children: [
                    Icon(Icons.star_rate),
                    //Text(rating),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
