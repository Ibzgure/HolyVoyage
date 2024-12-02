import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

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
                _showEmailDialog(context);
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

  void _showEmailDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your Email'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Email Address"),
            keyboardType: TextInputType.emailAddress,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String email = emailController.text;
                if (email.isNotEmpty) {
                  _sendEmail(email);
                  Navigator.of(context).pop();
                  _showSuccessDialog(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid email address')),
                  );
                }
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }

  // Use Firebase Cloud Functions to send email
  Future<void> _sendEmail(String email) async {
    try {
      final HttpsCallable sendEmailFunction = FirebaseFunctions.instance.httpsCallable('sendEmail');
      final result = await sendEmailFunction.call({
        'email': email,
        'message': 'Your visa application has been successfully submitted.',
      });
      print('Email sent: $result');
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Successfully booked your application for a visa. You will be contacted.'),
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
