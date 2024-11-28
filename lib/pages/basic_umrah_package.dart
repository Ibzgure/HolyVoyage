import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';

class BasicUmrahPage extends StatefulWidget {
  const BasicUmrahPage({super.key});

  @override
  _BasicUmrahPageState createState() => _BasicUmrahPageState();
}

class _BasicUmrahPageState extends State<BasicUmrahPage> {
  int? selectedPeople; // Store selected number of people
  int pricePerPerson = 1200; // Example price for each person

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Umrah Package'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        // Make the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/image11.jpg', // Update with correct image path
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 16),
              const Text(
                'Basic Umrah Package',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This package includes the following:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const Text('- Round-trip airfare (economy class)'),
              const Text('- Accommodation in a 3-star hotel (shared room)'),
              const Text('- Daily breakfast'),
              const Text('- Transportation to and from the airport'),
              const Text('- Basic visa processing'),
              const SizedBox(height: 20),

              // Dropdown to select number of people
              const Text('Select number of people:',
                  style: TextStyle(fontSize: 16)),
              DropdownButton<int>(
                hint: const Text('Select number of people'),
                value: selectedPeople,
                onChanged: (value) {
                  setState(() {
                    selectedPeople = value;
                  });
                },
                items: List.generate(
                        10, (index) => index + 1) // Generate numbers 1-10
                    .map((e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text(e.toString()),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              // Price display
              selectedPeople != null
                  ? Text(
                      'Total Price: \$${selectedPeople! * pricePerPerson}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  : const SizedBox.shrink(),

              const SizedBox(height: 20),

              // Button to proceed to RegistrationPage for selected people
              ElevatedButton(
                onPressed: () {
                  if (selectedPeople != null) {
                    int totalPrice = selectedPeople! *
                        pricePerPerson; // Dynamically calculate total price
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(
                          numberOfPeople: selectedPeople!,
                          totalPrice:
                              totalPrice, // Pass the correct total price
                          onComplete: () {
                            // After completing registration, proceed to billing
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillingPage(
                                  totalPrice: totalPrice,
                                  packageName: 'Basic Umrah',
                                  price: pricePerPerson.toString(),
                                  numberOfPeople: selectedPeople!,
                                ),
                              ),
                            );
                          },
                          price: '',
                          packageName: '',
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please select the number of people')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Proceed to Registration'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
                child: const Text('Back',
                    style: TextStyle(fontSize: 16, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
