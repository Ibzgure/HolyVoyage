import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset your password',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFCE5),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your email',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle password reset logic here
              },
              child: const Text('Send Reset Link'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back to the login page
              },
              child: const Text(
                'Back to Login',
                style: TextStyle(color: Color(0xFF4A90E2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
