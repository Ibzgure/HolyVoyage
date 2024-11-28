import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures resizing with the keyboard
      appBar: AppBar(
        title: const Text('Billing Information'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        // Wrap content in a scrollable view
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
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
            ],
            if (selectedPaymentMethod == 'Credit Card') ...[
              const Text(
                'Enter your Credit/Debit Card Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: _cardNumberController,
                decoration: const InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _expDateController,
                decoration:
                    const InputDecoration(labelText: 'Expiration Date (MM/YY)'),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _cvvController,
                decoration: const InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
            ],

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                if (_phoneNumberController.text.isEmpty &&
                    (_cardNumberController.text.isEmpty ||
                        _expDateController.text.isEmpty ||
                        _cvvController.text.isEmpty)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please fill in the payment details')),
                  );
                  return;
                }

                // Simulate Payment Completion Logic
                if (selectedPaymentMethod == 'M-Pesa' ||
                    selectedPaymentMethod == 'Airtel Money') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Payment Pending'),
                      content: Text(
                          'Complete your payment using instructions sent to ${_phoneNumberController.text}.'),
                    ),
                  );
                } else if (selectedPaymentMethod == 'Credit Card') {
                  // Here we would implement actual card processing logic (e.g., using a gateway like Flutterwave)
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Payment Pending'),
                      content: Text('Your card payment is being processed.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}