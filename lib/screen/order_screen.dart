import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/screen/mygooglepay.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No orders found'));
          }

          var orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];
debugPrint('Person Name :  ${order['username']}');
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          order['imageUrl'],
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: ${order['price']} USD',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Person Name :  ${order['username']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'Ordered at: ${order['orderTime'].toDate()}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _cancelBooking(order.id, context);
                                  },
                                  icon: Icon(Icons.details),
                                  label: Text('Cancel '),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                ElevatedButton.icon(
                                  onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>MyGooglePay(amount: order['price'],)));
                                  },
                                  icon: Icon(Icons.payment),
                                  label: Text('Pay'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  void _cancelBooking(String bookingId, BuildContext context) {
    FirebaseFirestore.instance.collection('orders')
        .doc(bookingId)
        .delete()
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Cancelled')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to cancel Order: $error')));
    });
  }
}

