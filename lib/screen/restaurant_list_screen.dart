import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/semantic_analysis_screen.dart';
import 'package:restaurants_app/viewmodel/restaurantlist_viewmodel.dart';
import 'menu_screen.dart';

class RestaurantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantListViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        appBar: AppBar(title: Text('Restaurants')),
        drawer: Drawer(
          backgroundColor: Colors.lime,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/personiamge.jpeg'),
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "User Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SemanticAnalysisScreen(restaurants: viewModel.restaurants)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  // Logout logic
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/restaurantbackgroundimage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView.builder(
              itemCount: viewModel.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = viewModel.restaurants[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(restaurant.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MenuScreen(restaurantId: restaurant.id, restaurantName: restaurant.name, menu: restaurant.menu),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
