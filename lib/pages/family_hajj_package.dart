import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';

class FamilyHajjPackagePage extends StatefulWidget {
  const FamilyHajjPackagePage({super.key});

  @override
  _FamilyHajjPackagePageState createState() => _FamilyHajjPackagePageState();
}

class _FamilyHajjPackagePageState extends State<FamilyHajjPackagePage> {
  int? selectedFamilyMembers; // Number of family members selected
  final int pricePerPerson = 4500; // Price per person

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Hajj Package 2024'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Image.asset(
              'assets/image.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Package Title
            const Text(
              'Family Hajj Package 2024',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Package Details
            const Text(
              'This package includes:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              '- Round-trip airfare (economy class)\n'
              '- Visa processing\n'
              '- Accommodation in Makkah (4-star hotel, family room)\n'
              '- Accommodation in Madinah (4-star hotel, family room)\n'
              '- Daily meals (half board)\n'
              '- Family-friendly group transportation to Hajj sites\n'
              '- Childcare services during group activities',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Dropdown to select number of family members
            const Text('Select number of family members:',
                style: TextStyle(fontSize: 16)),
            DropdownButton<int>(
              hint: const Text('Select number of family members'),
              value: selectedFamilyMembers,
              onChanged: (value) {
                setState(() {
                  selectedFamilyMembers = value;
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

            // Display total price
            selectedFamilyMembers != null
                ? Text(
                    'Total Price: \$${selectedFamilyMembers! * pricePerPerson}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                : const SizedBox.shrink(),

            const SizedBox(height: 20),

            // Proceed to Billing Button
            ElevatedButton(
              onPressed: () {
                if (selectedFamilyMembers != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillingPage(
                        packageName: 'Family Hajj Package 2024',
                        price: pricePerPerson.toString(),
                        numberOfPeople: selectedFamilyMembers!,
                        totalPrice: selectedFamilyMembers! * pricePerPerson,
                      ),
                    ),
                  );
                } else {
                  // Show error message if no family members selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Please select the number of family members')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Proceed to Billing'),
            ),
            const SizedBox(height: 20),

            // Back Button
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
    );
  }
}
