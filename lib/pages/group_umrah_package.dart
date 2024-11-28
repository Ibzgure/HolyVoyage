import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registration_page.dart'; // Ensure this import path is correct

class GroupUmrahPackagePage extends StatefulWidget {
  const GroupUmrahPackagePage({super.key});

  @override
  _GroupUmrahPackagePageState createState() => _GroupUmrahPackagePageState();
}

class _GroupUmrahPackagePageState extends State<GroupUmrahPackagePage> {
  int? selectedGroupSize; // Number of group members selected
  final int pricePerPerson = 3000; // Price per person

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Umrah Package 2024'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Image.asset(
              'assets/image12.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Package Title
            const Text(
              'Group Umrah Package 2024',
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
              '- Accommodation in Makkah (shared rooms)\n'
              '- Accommodation in Madinah (shared rooms)\n'
              '- Daily meals (full board)\n'
              '- Group transportation to religious sites\n'
              '- Guided group activities',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Dropdown to select group size
            const Text('Select group size:', style: TextStyle(fontSize: 16)),
            DropdownButton<int>(
              hint: const Text('Select number of group members'),
              value: selectedGroupSize,
              onChanged: (value) {
                setState(() {
                  selectedGroupSize = value;
                });
              },
              items: List.generate(
                      20, (index) => index + 1) // Generate numbers 1-20
                  .map((e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text(e.toString()),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Display total price
            selectedGroupSize != null
                ? Text(
                    'Total Price: \$${selectedGroupSize! * pricePerPerson}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                : const SizedBox.shrink(),

            const SizedBox(height: 20),

            // Proceed to Registration Button
            ElevatedButton(
              onPressed: () {
                if (selectedGroupSize != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(
                        packageName: 'Group Umrah Package 2024',
                        price: pricePerPerson.toString(),
                        numberOfPeople: selectedGroupSize!,
                        totalPrice: selectedGroupSize! * pricePerPerson,
                        onComplete:
                            () {}, // Passing an empty function as onComplete
                      ),
                    ),
                  );
                } else {
                  // Show error message if no group size is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please select the group size')),
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
