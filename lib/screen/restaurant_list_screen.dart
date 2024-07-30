import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/review_screen.dart';
import 'package:restaurants_app/screen/semantic_analysis_screen.dart';
import 'package:restaurants_app/viewmodel/restaurantlist_viewmodel.dart';

import '../constants/constatsvalue.dart';
import 'menu_screen.dart';

class RestaurantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantListViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        appBar: AppBar(title: Text('Restaurants')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(DynamicSize().user?.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var userData = snapshot.data!.data() as Map<String, dynamic>?;
                      DynamicSize.username = userData?['username'];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${userData!['username']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Semantic Analysis'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SemanticAnalysisScreen(restaurants: viewModel.restaurants)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Give Feedback'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ReviewScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {

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
                  image:
                      AssetImage('assets/images/restaurantbackgroundimage.png'),
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
                          builder: (context) => MenuScreen(
                              restaurantId: restaurant.id,
                              restaurantName: restaurant.name,
                              menu: restaurant.menu),
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
