import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';

class StandardUmrahPackagePage extends StatefulWidget {
  const StandardUmrahPackagePage({super.key});

  @override
  _StandardUmrahPackagePageState createState() =>
      _StandardUmrahPackagePageState();
}

class _StandardUmrahPackagePageState extends State<StandardUmrahPackagePage> {
  int? selectedPeople;
  int pricePerPerson = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Umrah Package 2024 (Standard)'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/full-packages');
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
                      image: AssetImage('assets/image12.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Umrah Package 2024 (Standard)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Price per person: \$${pricePerPerson.toString()}',
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Package Includes:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '- Round-trip airfare (business class)\n'
                  '- Accommodation in a 4-star hotel (shared room)\n'
                  '- Daily breakfast and dinner\n'
                  '- Transportation to and from the airport\n'
                  '- Visa processing\n'
                  '- Guided tours to key religious sites',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
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
                      int totalPrice = selectedPeople! * pricePerPerson;
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
                                    packageName: 'Umrah Package 2024 (Standard)',
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
