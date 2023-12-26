enum Rating {
  one,
  oneNhalf,
  two,
  twoNhalf,
  three,
  threeNhalf,
  four,
  fourNhalf,
  five,
}


class RestaurantItem {
  final String id;
  final String imageUrl;
  final String name;
  final String type;
  final Rating rating;

  RestaurantItem(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.rating,
      required this.type});
}
