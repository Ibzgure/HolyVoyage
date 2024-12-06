import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillingPage extends StatefulWidget {
  final int totalPrice;
  final String packageName;
  final String price;
  final int numberOfPeople;

  const BillingPage({
    super.key,
    required this.totalPrice,
    required this.packageName,
    required this.price,
    required this.numberOfPeople,
  });

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final _phoneNumberController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();
  String selectedPaymentMethod = 'None';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to handle payment confirmation
  Future<void> _confirmPayment() async {
    if ((selectedPaymentMethod == 'M-Pesa' || selectedPaymentMethod == 'Airtel Money') &&
        _phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your phone number')),
      );
      return;
    } else if (selectedPaymentMethod == 'Credit Card' &&
        (_cardNumberController.text.isEmpty ||
            _expDateController.text.isEmpty ||
            _cvvController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all card details')),
      );
      return;
    }

    // Save the payment data to Firestore
    try {
      await _firestore.collection('payments').add({
        'packageName': widget.packageName,
        'pricePerPerson': widget.price,
        'numberOfPeople': widget.numberOfPeople,
        'totalPrice': widget.totalPrice,
        'paymentMethod': selectedPaymentMethod,
        'phoneNumber': _phoneNumberController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show payment success dialog
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Payment Successful'),
            content: Text('Your payment has been made successfully!'),
          );
        },
      );

      // Dismiss the dialog after 4 seconds and navigate to Landing Page
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context)
          ..pop() // Close the alert dialog
          ..pop(); // Navigate back to Landing Page
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Billing Information'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Section
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Package: ${widget.packageName}'),
            Text('Price per Person: \$${widget.price}'),
            Text('Number of People: ${widget.numberOfPeople}'),
            Text('Total Price: \$${widget.totalPrice}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            const Divider(thickness: 1, height: 30),

            // Payment Method Selection
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.phone_android, color: Colors.teal[700]),
              title: const Text('M-Pesa'),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'M-Pesa';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_android, color: Colors.teal[700]),
              title: const Text('Airtel Money'),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Airtel Money';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.teal[700]),
              title: const Text('Credit/Debit Card'),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Credit Card';
                });
              },
            ),
            const Divider(thickness: 1, height: 30),

            // Input Fields for Selected Payment Method
            if (selectedPaymentMethod == 'M-Pesa' ||
                selectedPaymentMethod == 'Airtel Money') ...[
              const Text(
                'Enter your phone number for payment:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
            if (selectedPaymentMethod == 'Credit Card') ...[
              const Text(
                'Enter your Credit/Debit Card Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _cardNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _expDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiration Date (MM/YY)',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _cvvController,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],

            // Confirm Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _confirmPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shadowColor: Colors.black.withOpacity(0.25),
                    elevation: 8,
                  ),
                  child: const Text('Confirm Order'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
