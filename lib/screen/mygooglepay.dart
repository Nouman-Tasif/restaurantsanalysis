import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  final double amount;
  const MyGooglePay({Key? key, required this.amount}) : super(key: key);

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {

  void onGooglePayResult(paymentResult) {
    // Handle the result from the Google Pay transaction
    // You can send the resulting token to your server or PSP
    debugPrint('Payment Result: $paymentResult');
  }

  Future<Map<String, dynamic>> loadPaymentConfiguration() async {
    final jsonString = await rootBundle.loadString('assets/sample_payment_configuration.json');
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Pay'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadPaymentConfiguration(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading payment configuration'));
          }

          final paymentConfiguration = snapshot.data!;

          return Center(
            child: GooglePayButton(
              paymentConfiguration: PaymentConfiguration.fromJsonString(json.encode(paymentConfiguration)),
              paymentItems: [
                PaymentItem(
                  label: 'Total',
                  amount: widget.amount.toString(),
                  status: PaymentItemStatus.final_price,
                )
              ],
              type: GooglePayButtonType.pay,
              onPaymentResult: onGooglePayResult,
              loadingIndicator: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
