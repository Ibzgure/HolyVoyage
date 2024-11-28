import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_application_1/pages/landing_page.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  // Controllers for capturing user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login with Firebase
  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Check if the widget is still mounted to safely navigate
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address.';
      } else {
        errorMessage = 'Something went wrong. Please try again.';
      }

      // Display error in an alert dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 76, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/logo1.png', // Replace with your actual logo asset
                height: 200,
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 20),

            // Email Input Field
            TextField(
              controller: _emailController, // Controller for email input
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 255, 254, 246),
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

            // Password Input Field
            TextField(
              controller: _passwordController, // Controller for password input
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFCE5),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: _login, // Call the login function
              child: const Text('Login'),
            ),

            const SizedBox(height: 20),

            // Forgot Password & Sign Up Links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromRGBO(243, 255, 206, 0.714),
                      fontSize: 16,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Sign Up page here
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 218, 154),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
