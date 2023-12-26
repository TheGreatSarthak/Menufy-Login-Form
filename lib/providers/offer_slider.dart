import 'package:flutter/material.dart';

class OfferSlider with ChangeNotifier {
  final List<String> _offers = [
    'https://happysale.in/hs/img/w/up/zomatocouponshappysalejpg1626767964284.jpg',
    'https://offers.getsimpl.com/wp-content/uploads/2021/12/ZomatoOfferCard-Weekend_Dec-2-1.jpg',
    'https://cdn.grabon.in/gograbon/images/category/1546252575451.png',
    'https://static.toiimg.com/thumb/msid-67790268,width-1280,height-720,resizemode-4/.jpg',
  ];

  List<String> get offers {
    return [..._offers];
  }
}
