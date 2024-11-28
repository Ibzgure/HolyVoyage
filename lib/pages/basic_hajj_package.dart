import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/billing_page.dart';

class BasicHajjPage extends StatefulWidget {
  const BasicHajjPage({super.key});

  @override
  _BasicHajjPageState createState() => _BasicHajjPageState();
}

class _BasicHajjPageState extends State<BasicHajjPage> {
  int? selectedPeople;
  int pricePerPerson = 5000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hajj Package'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/image7.jpg', // Ensure this asset exists
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Package Title
            const Text(
              'Basic Hajj Package',
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
            const Text('- Accommodation in Makkah (3-star hotel)'),
            const Text('- Accommodation in Madinah (3-star hotel)'),
            const Text('- Group transportation to Hajj sites'),
            const Text('- Basic visa processing'),
            const Text('- Daily meals (breakfast only)'),
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

            const SizedBox(height: 20),

            // Proceed to Registration Button
            ElevatedButton(
              onPressed: () {
                if (selectedPeople != null) {
                  int totalPrice = selectedPeople! * pricePerPerson;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillingPage(
                        totalPrice: totalPrice,
                        packageName: 'Basic Hajj',
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
                backgroundColor: Colors.lightBlue,
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
                Navigator.pop(context);
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
