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
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package image
            Image.asset(
              'assets/image12.jpg', // Ensure this file exists in the assets folder
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Package title
            const Text(
              'Umrah Package 2024 (Standard)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Package price per person
            Text(
              'Price per person: \$${pricePerPerson.toString()}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 14),

            // Package details
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

            // Dropdown for selecting the number of people
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
              items: List.generate(10, (index) => index + 1)
                  .map((e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text(e.toString()),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Total price display
            if (selectedPeople != null)
              Text(
                'Total Price: \$${selectedPeople! * pricePerPerson}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

            const SizedBox(height: 20),

            // Proceed button
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
                    const SnackBar(
                        content: Text('Please select the number of people')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Proceed to Registration'),
            ),

            const SizedBox(height: 8),

            // Back button
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
