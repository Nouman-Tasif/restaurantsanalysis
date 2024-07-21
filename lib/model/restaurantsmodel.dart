

import 'package:restaurants_app/model/menumodel.dart';

class Restaurant {
  final String id;
  final String name;
  final List<MenuItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.menu,
  });
}
