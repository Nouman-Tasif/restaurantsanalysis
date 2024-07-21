import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/menumodel.dart';
import '../model/ordermodel.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final MenuItem menuItem;

  OrderConfirmationScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    OrderItem order = OrderItem(menuItem: menuItem, orderTime: DateTime.now());

    Future<void> _placeOrder() async {
      await FirebaseFirestore.instance.collection('orders').add({
        'itemName': order.menuItem.name,
        'price': order.menuItem.price,
        'orderTime': order.orderTime,
        'calories': order.menuItem.calories,
        'fat': order.menuItem.fat,
        'protein': order.menuItem.protein,
        'sodium': order.menuItem.sodium,
        'imageUrl': order.menuItem.imageUrl, // Save image URL
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/foodorderpicture.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  menuItem.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.black54, // Semi-transparent background
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Details',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Item: ${order.menuItem.name}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Price: ${order.menuItem.price} USD',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Sodium: ${order.menuItem.sodium} g',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Allergens: ${order.menuItem.allergens.join(', ')}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Fat: ${order.menuItem.fat} g',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Calories: ${order.menuItem.calories} g',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Ordered at: ${order.orderTime}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await _placeOrder();
                      Navigator.pop(context);
                    },
                    child: Text('Place Order'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
