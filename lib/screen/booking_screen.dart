import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String restaurantId;
  final String restaurantName;
  final int tableLimit; // Add table limit as a parameter

  BookingScreen({
    required this.restaurantId,
    required this.restaurantName,
    required this.tableLimit, // Add table limit as a parameter
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

  int availableSeats = 0;

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
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (selectedDate != null) {
                            setState(() {
                              _dateController.text = '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}'; // Format date as YYYY-MM-DD
                            });
                            _fetchAvailableSeats();
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
                            _fetchAvailableSeats();
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
                      Text('Available seats: $availableSeats'), // Display available seats
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

  void _fetchAvailableSeats() async {
    final dateTime = '${_dateController.text} ${_timeController.text}';
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('restaurantId', isEqualTo: widget.restaurantId)
        .where('datetime', isEqualTo: dateTime)
        .get();

    int bookedSeats = snapshot.docs.fold(0, (total, doc) => total + int.parse(doc['seats']));
    setState(() {
      availableSeats = widget.tableLimit - bookedSeats;
    });
  }

  void _checkBookingLimit() async {
    final dateTime = '${_dateController.text} ${_timeController.text}';
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('restaurantId', isEqualTo: widget.restaurantId)
        .where('datetime', isEqualTo: dateTime)
        .get();

    int bookedSeats = snapshot.docs.fold(0, (total, doc) => total + int.parse(doc['seats']));

    if (bookedSeats >= widget.tableLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking limit reached for the selected date and time.')),
      );
    } else {
      _saveBooking();
    }
  }

  void _saveBooking() {
    final bookingData = {
      'name': '${_firstNameController.text} ${_lastNameController.text}',
      'datetime': '${_dateController.text} ${_timeController.text}', // Save combined date and time
      'seats': _seatsController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'comments': _commentsController.text,
      'restaurantId': widget.restaurantId,
      'restaurantName': widget.restaurantName,
    };

    FirebaseFirestore.instance
        .collection('bookings')
        .add(bookingData)
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Table booked successfully!')));
      Navigator.pop(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to book table: $error')));
    });
  }
}
