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
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/full-packages'); // Navigate back to FullPackagesPage
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section with dynamic scaling
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/image11.jpg'), // Update with the correct image path
                      fit: BoxFit.cover, // Ensures the image covers the container
                    ),
                  ),
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
                const Text('Select number of people:', style: TextStyle(fontSize: 16)),
                DropdownButton<int>(
                  hint: const Text('Select number of people'),
                  value: selectedPeople,
                  onChanged: (value) {
                    setState(() {
                      selectedPeople = value;
                    });
                  },
                  items: List.generate(10, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                if (selectedPeople != null)
                  Text(
                    'Total Price: \$${selectedPeople! * pricePerPerson}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                const SizedBox(height: 80), // Add space for floating buttons
              ],
            ),
          ),
          // Floating Buttons
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (selectedPeople != null) {
                      int totalPrice = selectedPeople! * pricePerPerson; // Calculate total price
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(
                            numberOfPeople: selectedPeople!,
                            totalPrice: totalPrice,
                            onComplete: () {
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
                        const SnackBar(content: Text('Please select the number of people')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Proceed to Registration'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                  child: const Text('Back', style: TextStyle(fontSize: 16, color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
