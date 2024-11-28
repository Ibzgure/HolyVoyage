import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';

class PremiumUmrahPackagePage extends StatefulWidget {
  const PremiumUmrahPackagePage({super.key});

  @override
  _PremiumUmrahPackagePageState createState() =>
      _PremiumUmrahPackagePageState();
}

class _PremiumUmrahPackagePageState extends State<PremiumUmrahPackagePage> {
  int? selectedPeople;
  int pricePerPerson = 8000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Umrah Package 2024 (Premium)'),
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
              'assets/image11.jpg', // Ensure the image path is correct
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Package title
            const Text(
              'Umrah Package 2024 (Premium)',
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
              '- Priority visa processing\n'
              '- Accommodation in Makkah (5-star hotel, private suite)\n'
              '- Accommodation in Madinah (5-star hotel, private suite)\n'
              '- Gourmet meals (full board)\n'
              '- Private luxury transportation for all activities\n'
              '- Dedicated personal guide throughout the pilgrimage\n'
              '- 24/7 health and wellness services\n'
              '- Exclusive Ziyarat tours in luxury vehicles\n'
              '- 24/7 concierge service for personalized needs',
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
                                packageName: 'Umrah Package 2024 (Premium)',
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
