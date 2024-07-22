import 'package:flutter/material.dart';

import '../core/semantics_analysis.dart';
import '../model/restaurantsmodel.dart';

class SemanticAnalysisScreen extends StatelessWidget {
  final List<Restaurant> restaurants;

  SemanticAnalysisScreen({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semantic Analysis of Reviews'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/reviewbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, restaurantIndex) {
              final restaurant = restaurants[restaurantIndex];
              return ExpansionTile(
                title: Text(restaurant.name),
                children: restaurant.reviews.map((review) {
                  return ListTile(
                    title: Text(review.username),
                    subtitle: Text(review.comment),
                    trailing: FutureBuilder<String>(
                      future: SentimentAnalysis().analyzeSentiment(review.comment),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error');
                        } else if (snapshot.hasData) {
                          return Text(snapshot.data!); // Use ! to assert that snapshot.data is not null
                        } else {
                          return Text('Unknown');
                        }
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      )

    );
  }
}
