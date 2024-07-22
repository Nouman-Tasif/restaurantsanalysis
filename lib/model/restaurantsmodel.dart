

import 'package:restaurants_app/model/menumodel.dart';
import 'package:restaurants_app/model/reviewmodel.dart';

class Restaurant {
  final String id;
  final String name;
  final List<MenuItem> menu;
  final List<Review> reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.menu,
    required this.reviews
  });
}
