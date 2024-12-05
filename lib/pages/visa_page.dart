import 'dart:math';
import 'package:flutter/material.dart';

class VisaPage extends StatelessWidget {
  const VisaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visa Processing Information'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/full-packages');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Visa Requirements for Hajj and Umrah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'To travel for Hajj or Umrah, you will need to apply for a visa. Below are the requirements:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildVisaRequirementItem('1. A valid passport with at least 6 months validity.'),
            _buildVisaRequirementItem('2. Two recent passport-sized photographs.'),
            _buildVisaRequirementItem('3. Completed visa application form.'),
            _buildVisaRequirementItem('4. Proof of Hajj/Umrah package booking.'),
            _buildVisaRequirementItem('5. Vaccination certificate (e.g., COVID-19, Meningitis).'),
            _buildVisaRequirementItem('6. Return flight ticket.'),
            const SizedBox(height: 20),
            const Text(
              'Visa Processing Time:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Visa processing typically takes 5-10 business days depending on the package selected.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Visa Application Fees:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Basic Package: \$150\n• Standard Package: \$200\n• Premium Package: \$300',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            FloatingActionButton.extended(
              onPressed: () {
                // Generate and display the unique ID
                String uniqueId = _generateRandomString(6);
                _showUniqueIdDialog(context, uniqueId);
              },
              label: const Text('Apply for Visa'),
              icon: const Icon(Icons.check_circle),
              backgroundColor: const Color.fromARGB(255, 231, 76, 255),
              elevation: 8.0,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildVisaRequirementItem(String requirement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.teal),
          const SizedBox(width: 10),
          Expanded(child: Text(requirement)),
        ],
      ),
    );
  }

  // Function to generate a 6-character unique ID
  String _generateRandomString(int length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rand = Random();
    return List.generate(length, (index) {
      return characters[rand.nextInt(characters.length)];
    }).join();
  }

  // Function to show the generated ID in a dialog
  void _showUniqueIdDialog(BuildContext context, String uniqueId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unique Visa Application ID'),
          content: Text('Your unique Visa Application ID is: $uniqueId'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
