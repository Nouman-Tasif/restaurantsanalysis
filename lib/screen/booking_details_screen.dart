import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:restaurants_app/constants/constatsvalue.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: const Text('Current Bookings')),
      ),
      body: Container(
        width: DynamicSize.width(0.99, context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tableImage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  'No bookings available.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }

            final bookings = snapshot.data!.docs;
            final dateFormat = DateFormat('yyyy-MM-dd hh:mm a'); // Adjust the format as needed

            return AnimationLimiter(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  final bookingDateTimeString = booking['datetime'];
                  DateTime? bookingDateTime;

                  try {
                    bookingDateTime = dateFormat.parse(bookingDateTimeString);
                  } catch (e) {
                    print('Error parsing date: $e');
                    bookingDateTime = DateTime.now(); // Fallback to current date if parsing fails
                  }

                  final currentTime = DateTime.now();
                  final isFutureBooking = bookingDateTime.isAfter(currentTime);

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Card(
                          margin: EdgeInsetsDirectional.only(
                            top: DynamicSize.height(0.03, context),
                            end: DynamicSize.width(0.03, context),
                          ),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              booking['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Restaurant Name: ${booking['restaurantName']}', style: TextStyle(fontSize: 15)),
                                Text('Seats: ${booking['seats']}'),
                                Text('Time: ${dateFormat.format(bookingDateTime!)}'),
                              ],
                            ),
                            trailing: isFutureBooking
                                ? IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                _cancelBooking(booking.id, context);
                              },
                            )
                                : Text('Not Available'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _cancelBooking(String bookingId, BuildContext context) {
    FirebaseFirestore.instance
        .collection('bookings')
        .doc(bookingId)
        .delete()
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking Cancelled')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to cancel booking: $error')));
    });
  }
}
