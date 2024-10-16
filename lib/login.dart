import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

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
            // MomHive Logo (Placeholder for an actual image)
            Center(
              child: Image.asset(
                'assets/logo1.png', // Replace with your actual logo asset
                height: 200,
              ),
            ),
            const SizedBox(height: 20, width: 20),

            Center(
              child: Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 20),

            // Email Input Field
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 159, 143, 15),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your email',
                hintStyle: const TextStyle(color: Colors.grey), // Add this line
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: const Text('Login'),
            ),

            const SizedBox(height: 20),

            // Forgot Password & Sign Up Links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password action
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
                  onTap: (){        },
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