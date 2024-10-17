import 'package:firebase_core/firebase_core.dart'; // Keep this import
import 'package:flutter/material.dart';

import '/login.dart';
import 'forgot_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MomHiveApp()); // Run your app after Firebase is initialized
}

class MomHiveApp extends StatelessWidget {
  const MomHiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hajj',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 66, 41, 170),
        scaffoldBackgroundColor: const Color.fromARGB(255, 180, 27, 27),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Color.fromARGB(255, 181, 31, 31), fontSize: 16, fontFamily: 'Roboto'),
          headlineSmall: TextStyle(
              color: Color(0xFF4D4D4D),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7C843),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}
