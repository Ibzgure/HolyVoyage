import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:flutter_application_1/pages/billing_page.dart';

class StandardHajjPackagePage extends StatefulWidget {
  const StandardHajjPackagePage({super.key});

  @override
  _StandardHajjPackagePageState createState() =>
      _StandardHajjPackagePageState();
}

class _StandardHajjPackagePageState extends State<StandardHajjPackagePage> {
  int? selectedPeople;
  int pricePerPerson = 5000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Package 2024 (Standard)'),
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
                // Package Image
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/image6.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Package Title
                const Text(
                  'Hajj Package 2024 (Standard)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Package Details
                const Text(
                  'This package includes the following:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const Text('- Round-trip airfare (economy class)'),
                const Text('- Visa processing'),
                const Text('- Accommodation in Makkah (3-star hotel)'),
                const Text('- Accommodation in Madinah (3-star hotel)'),
                const Text('- Group transportation to Hajj sites'),
                const Text('- Daily meals (breakfast only)'),
                const Text('- Basic travel insurance'),
                const SizedBox(height: 20),

                // Dropdown to select the number of people
                const Text(
                  'Select number of people:',
                  style: TextStyle(fontSize: 16),
                ),
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

                // Total Price Display
                if (selectedPeople != null)
                  Text(
                    'Total Price: \$${selectedPeople! * pricePerPerson}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                const SizedBox(height: 80),
              ],
            ),
          ),
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
                            packageName: 'Hajj Package 2024 (Standard)',
                            price: pricePerPerson.toString(),
                            onComplete: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillingPage(
                                    totalPrice: totalPrice,
                                    packageName:
                                        'Hajj Package 2024 (Standard)',
                                    price: pricePerPerson.toString(),
                                    numberOfPeople: selectedPeople!,
                                  ),
                                ),
                              );
                            },
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
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Proceed to Registration'),
                ),
                const SizedBox(height: 8),

                // Back Button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
