import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';
// Import the registration page

class PremiumHajjPackagePage extends StatefulWidget {
  const PremiumHajjPackagePage({super.key});

  @override
  _PremiumHajjPackagePageState createState() => _PremiumHajjPackagePageState();
}

class _PremiumHajjPackagePageState extends State<PremiumHajjPackagePage> {
  int? selectedPeople = 1; // Default to 1 person
  int pricePerPerson = 10000;

  get totalPrice => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Package 2024 (Premium)'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Image.asset(
              'assets/hajj10.jpg', // Ensure this path matches your folder structure
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Package Price
            Text(
              'Price: \$${pricePerPerson.toString()}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            // Package Details
            const Text(
              'Package Includes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '- Round-trip airfare (first class)\n'
              '- Visa processing\n'
              '- Accommodation in Makkah (5-star hotel, private suite)\n'
              '- Accommodation in Madinah (5-star hotel, private suite)\n'
              '- Gourmet meals (full board)\n'
              '- Private luxury transportation to all Hajj sites\n'
              '- Dedicated personal guide throughout the journey\n'
              '- Comprehensive healthcare and wellness services\n'
              '- 24/7 concierge and VIP support services',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Dropdown for selecting number of people
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

            // Proceed to Registration Page Button
            ElevatedButton(
              onPressed: () {
                if (selectedPeople != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillingPage(
                        totalPrice: totalPrice,
                        packageName: 'Hajj Package 2024 (Premium)',
                        price: pricePerPerson.toString(),
                        numberOfPeople: selectedPeople!,
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
              child: const Text('Register for Package'),
            ),
            const SizedBox(height: 8),

            // Back Button
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
