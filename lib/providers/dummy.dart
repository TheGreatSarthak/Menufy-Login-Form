import 'package:flutter/material.dart';

import '../../models/restaurant_item.dart';

class DummyRes with ChangeNotifier {
  final List<RestaurantItem> _dummyRestaurants = [
    RestaurantItem(
      id: 'r1',
      name: 'Amrik Sukhdev',
      rating: Rating.five,
      type: 'mixed',
      imageUrl:
          'https://www.amriksukhdev.com/wp-content/uploads/2019/01/GALLERY5.jpg',
    ),
    RestaurantItem(
      id: 'r2',
      name: 'Haldirans',
      rating: Rating.four,
      type: 'northIndian',
      imageUrl:
          'https://www.amriksukhdev.com/wp-content/uploads/2019/01/GALLERY4.jpg',
    ),
  ];
  List<RestaurantItem> get dummyRes {
    return [..._dummyRestaurants];
  }

  List<RestaurantItem> search(String entry) {

    List<RestaurantItem> dekho= dummyRes
        .where((user) => user.name.toLowerCase().contains(entry.toLowerCase()))
        .toList();
        notifyListeners();
        return dekho;
  }
}
