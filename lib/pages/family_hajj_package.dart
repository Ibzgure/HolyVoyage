import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';

class FamilyHajjPackagePage extends StatefulWidget {
  const FamilyHajjPackagePage({super.key});

  @override
  _FamilyHajjPackagePageState createState() => _FamilyHajjPackagePageState();
}

class _FamilyHajjPackagePageState extends State<FamilyHajjPackagePage> {
  int? selectedFamilyMembers;
  final int pricePerPerson = 4500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Hajj Package 2024'),
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
                // Header Image Section
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                const Text('- Round-trip airfare (economy class)'),
                const Text('- Visa processing'),
                const Text('- Accommodation in Makkah (4-star hotel, family room)'),
                const Text('- Accommodation in Madinah (4-star hotel, family room)'),
                const Text('- Daily meals (half board)'),
                const Text('- Family-friendly group transportation to Hajj sites'),
                const Text('- Childcare services during group activities'),
                const SizedBox(height: 20),

                // Dropdown to select number of family members
                const Text(
                  'Select number of family members:',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton<int>(
                  hint: const Text('Select number of family members'),
                  value: selectedFamilyMembers,
                  onChanged: (value) {
                    setState(() {
                      selectedFamilyMembers = value;
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

                // Display total price
                if (selectedFamilyMembers != null)
                  Text(
                    'Total Price: \$${selectedFamilyMembers! * pricePerPerson}',
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
                    if (selectedFamilyMembers != null) {
                      int totalPrice = selectedFamilyMembers! * pricePerPerson;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillingPage(
                            packageName: 'Family Hajj Package 2024',
                            price: pricePerPerson.toString(),
                            numberOfPeople: selectedFamilyMembers!,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select the number of family members'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Proceed to Billing'),
                ),
                const SizedBox(height: 8),
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
