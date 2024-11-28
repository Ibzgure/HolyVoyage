import 'package:flutter/material.dart';

class VisaPage extends StatelessWidget {
  const VisaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visa Processing Information'),
        backgroundColor: Colors.teal[700],
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
            _buildVisaRequirementItem(
                '1. A valid passport with at least 6 months validity.'),
            _buildVisaRequirementItem(
                '2. Two recent passport-sized photographs.'),
            _buildVisaRequirementItem('3. Completed visa application form.'),
            _buildVisaRequirementItem(
                '4. Proof of Hajj/Umrah package booking.'),
            _buildVisaRequirementItem(
                '5. Vaccination certificate (e.g., COVID-19, Meningitis).'),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/apply-for-visa'); // Modify route as needed
              },
              child: const Text('Apply for Visa'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Goes back to the previous page
              },
              child: const Text('Back'),
            ),
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
}
