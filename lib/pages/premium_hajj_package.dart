import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';

class PremiumHajjPackagePage extends StatefulWidget {
  const PremiumHajjPackagePage({super.key});

  @override
  _PremiumHajjPackagePageState createState() => _PremiumHajjPackagePageState();
}

class _PremiumHajjPackagePageState extends State<PremiumHajjPackagePage> {
  int? selectedPeople = 1; // Default to 1 person
  int pricePerPerson = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Package 2024 (Premium)'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255), // Matching color
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
                // Package Image
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/hajj10.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Package Title
                const Text(
                  'Hajj Package 2024 (Premium)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Package Price
                Text(
                  'Price: \$${pricePerPerson.toString()} per person',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),

                // Package Details
                const Text(
                  'This package includes the following:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const Text('- Round-trip airfare (first class)'),
                const Text('- Visa processing'),
                const Text('- Accommodation in Makkah (5-star hotel, private suite)'),
                const Text('- Accommodation in Madinah (5-star hotel, private suite)'),
                const Text('- Gourmet meals (full board)'),
                const Text('- Private luxury transportation to all Hajj sites'),
                const Text('- Dedicated personal guide'),
                const Text('- Comprehensive healthcare and wellness services'),
                const Text('- 24/7 concierge and VIP support services'),
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
                          builder: (context) => BillingPage(
                            totalPrice: totalPrice,
                            packageName: 'Premium Hajj Package 2024',
                            price: pricePerPerson.toString(),
                            numberOfPeople: selectedPeople!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select the number of people'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, // Matching color
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
