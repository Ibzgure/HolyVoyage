import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registration_page.dart'; // Ensure the import path is correct

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
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
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
                // Header Image Section with dynamic scaling
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
                const Text('- Round-trip airfare (economy class)'),
                const Text('- Visa processing'),
                const Text('- Accommodation in Makkah (shared rooms)'),
                const Text('- Accommodation in Madinah (shared rooms)'),
                const Text('- Daily meals (full board)'),
                const Text('- Group transportation to religious sites'),
                const Text('- Guided group activities'),
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
                  items: List.generate(20, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),

                // Display total price
                if (selectedGroupSize != null)
                  Text(
                    'Total Price: \$${selectedGroupSize! * pricePerPerson}',
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
                    if (selectedGroupSize != null) {
                      int totalPrice = selectedGroupSize! * pricePerPerson;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(
                            packageName: 'Group Umrah Package 2024',
                            price: pricePerPerson.toString(),
                            numberOfPeople: selectedGroupSize!,
                            totalPrice: totalPrice,
                            onComplete: () {}, // On complete action
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select the group size')),
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
