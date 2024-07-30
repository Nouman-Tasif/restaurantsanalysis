import 'package:flutter/material.dart';
import 'package:restaurants_app/constants/constatsvalue.dart';

import '../model/menumodel.dart';
import 'order_confirmation_screen.dart';

class MenuDetailScreen extends StatelessWidget {
  final MenuItem menuItem;

  MenuDetailScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menuItem.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: menuItem.imageUrl,
                  child: Image.asset(menuItem.imageUrl,
                      width: DynamicSize.width(0.99, context),
                      height: 200,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Text(
                menuItem.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${menuItem.calories} calories',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                '${menuItem.price} USD',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                menuItem.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildAllergens(menuItem),
              SizedBox(height: 20),
              _buildNutritionFacts(menuItem),
              SizedBox(height: 40),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderConfirmationScreen(menuItem: menuItem),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/order_now.png",
                      height: 50,
                      width: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllergens(MenuItem menuItem) {
    if (menuItem.allergens.isEmpty) {
      return SizedBox
          .shrink(); // Return an empty widget if there are no allergens
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Allergens',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: menuItem.allergens
              .map((allergen) => Chip(
                    label: Text(allergen),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildNutritionFacts(MenuItem menuItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutrition Facts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildNutritionIndicator(
              percentage: menuItem.calories,
              color: Colors.orange,
              label: 'Calories',
            ),
            SizedBox(width: 15),
            _buildNutritionIndicator(
              percentage: menuItem.fat,
              color: Colors.blue,
              label: 'Fat',
            ),
            SizedBox(width: 15),
            _buildNutritionIndicator(
              percentage: menuItem.protein,
              color: Colors.green,
              label: 'Protein',
            ),
            SizedBox(width: 15),
            _buildNutritionIndicator(
              percentage: menuItem.sodium,
              color: Colors.blueGrey,
              label: 'Sodium',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritionIndicator({
    required double percentage,
    required Color color,
    required String label,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: percentage / 100,
                color: color,
                backgroundColor: Colors.grey.shade200,
                strokeWidth: 6,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${percentage.toInt()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
