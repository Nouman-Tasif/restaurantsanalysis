import 'package:flutter/material.dart';
import 'package:restaurants_app/screen/booking_screen.dart';

import '../model/menumodel.dart';
import 'menu_detaills_screen.dart';

class MenuScreen extends StatelessWidget {
  final String restaurantId;
  final String restaurantName;
  final List<MenuItem> menu;

  MenuScreen(
      {required this.restaurantId,
      required this.restaurantName,
      required this.menu});

  @override
  Widget build(BuildContext context) {
    debugPrint("---------------${restaurantId}");
    // Categorize menu items dynamically
    Map<String, List<MenuItem>> categorizedMenu = {};

    // Populate categories
    for (var item in menu) {
      if (!categorizedMenu.containsKey(item.category)) {
        categorizedMenu[item.category] = [];
      }
      categorizedMenu[item.category]!.add(item);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingScreen(
                restaurantId: restaurantId,
                restaurantName: restaurantName,
                tableLimit: 20),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.asset("assets/images/bookATable.png"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/menubackgroundimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: categorizedMenu.entries.map((entry) {
              return CategorySection(
                categoryName: entry.key,
                items: entry.value,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<MenuItem> items;

  CategorySection({required this.categoryName, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 20),
      child: ExpansionTile(
        collapsedIconColor: Colors.white,
        title: Text(
          categoryName,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: items.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuDetailScreen(menuItem: item)),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.imageUrl,
                    child: Image.asset(
                      item.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
