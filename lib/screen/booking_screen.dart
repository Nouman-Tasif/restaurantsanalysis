import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final String restaurantId;
  final String restaurantName;
  final int tableLimit;

  BookingScreen({
    required this.restaurantId,
    required this.restaurantName,
    required this.tableLimit,
  });

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _seatsController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _commentsController = TextEditingController();

  int availableSeats = 0; // This will be dynamically fetched based on bookings

  @override
  void initState() {
    super.initState();
    availableSeats = widget.tableLimit;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _seatsController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white),
      fillColor: Colors.white.withOpacity(0.56),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book a Table')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundimagebookatable.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'BOOKING',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _dateController,
                        decoration: _inputDecoration('Date *'),
                        readOnly: true,
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode()); // Hide the keyboard
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );

                          if (selectedDate != null) {
                            setState(() {
                              _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate); // Format date as YYYY-MM-DD
                            });
                            _updateAvailableSeats();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _timeController,
                        decoration: _inputDecoration('Time *'),
                        readOnly: true,
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode()); // Hide the keyboard
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (selectedTime != null) {
                            setState(() {
                              _timeController.text = selectedTime.format(context); // Format time as HH:mm AM/PM
                            });
                            _updateAvailableSeats();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a time';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _seatsController,
                        decoration: _inputDecoration('Seats *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number of seats';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (int.parse(value) > availableSeats) {
                            return 'Only $availableSeats seats available';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text('Available seats: $availableSeats'),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: _inputDecoration('First Name *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: _inputDecoration('Last Name *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: _inputDecoration('Email *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneController,
                        decoration: _inputDecoration('Phone *'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _commentsController,
                        decoration: _inputDecoration('Comments (optional)'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _checkBookingLimit();
                          }
                        },
                        child: Text('Book a table'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkBookingLimit() async {
    await _checkForExpiredBookings(); // Check and remove expired bookings before checking booking limit

    if (_dateController.text.isEmpty || _timeController.text.isEmpty) return;

    final dateTime = _getFormattedDateTime();
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('restaurantId', isEqualTo: widget.restaurantId)
        .where('datetime', isEqualTo: dateTime.toIso8601String()) // store as ISO8601
        .get();

    int bookedSeats =
    snapshot.docs.fold(0, (total, doc) => total + int.parse(doc['seats']));
    if (bookedSeats + int.parse(_seatsController.text) > widget.tableLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No seats available for this date and time. Please select another time.'),
        ),
      );
    } else {
      _bookTable();
    }
  }

  void _bookTable() {
    final dateTime = _getFormattedDateTime();
    final bookingData = {
      'restaurantId': widget.restaurantId,
      'restaurantName': widget.restaurantName,
      'datetime': dateTime.toIso8601String(), // store as ISO8601
      'seats': _seatsController.text,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'comments': _commentsController.text,
    };

    FirebaseFirestore.instance.collection('bookings').add(bookingData);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking confirmed!'),
      ),
    );

    // Clear form fields after booking
    _dateController.clear();
    _timeController.clear();
    _seatsController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _commentsController.clear();
  }

  DateTime _getFormattedDateTime() {
    final date = _dateController.text;
    final time = _timeController.text;
    return DateFormat('yyyy-MM-dd hh:mm a').parse('$date $time');
  }

  Future<void> _checkForExpiredBookings() async {
    final now = DateTime.now();
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('datetime', isLessThanOrEqualTo: now.toIso8601String()) // use ISO8601 format
        .get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  void _updateAvailableSeats() async {
    if (_dateController.text.isEmpty || _timeController.text.isEmpty) return;

    final dateTime = _getFormattedDateTime();
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('restaurantId', isEqualTo: widget.restaurantId)
        .where('datetime', isEqualTo: dateTime.toIso8601String()) // use ISO8601 format
        .get();

    int bookedSeats =
    snapshot.docs.fold(0, (total, doc) => total + int.parse(doc['seats']));
    setState(() {
      availableSeats = widget.tableLimit - bookedSeats;
    });
  }
}
