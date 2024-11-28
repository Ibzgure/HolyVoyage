import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/landing_page.dart';
import 'package:flutter_application_1/pages/full_packages_page.dart';
import 'package:flutter_application_1/pages/visa_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:flutter_application_1/pages/hajj_brochures_page.dart';
import 'package:flutter_application_1/pages/tour_guides_page.dart';
import 'package:flutter_application_1/pages/basic_umrah_package.dart';
import 'package:flutter_application_1/pages/standard_umrah_package.dart';
import 'package:flutter_application_1/pages/premium_umrah_package.dart';
import 'package:flutter_application_1/pages/basic_hajj_package.dart';
import 'package:flutter_application_1/pages/standard_hajj_package.dart';
import 'package:flutter_application_1/pages/premium_hajj_package.dart';
import 'package:flutter_application_1/pages/family_hajj_package.dart';
import 'package:flutter_application_1/pages/group_umrah_package.dart';
import 'firebase_options.dart';
import 'forgot_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("Firebase initialized successfully");
  } catch (e) {
    debugPrint("Error initializing Firebase: $e");
  }


  runApp(const SeamlessPilgrimageApp());
}

class SeamlessPilgrimageApp extends StatelessWidget {
  const SeamlessPilgrimageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seamless Pilgrimage',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Roboto',
          ),
          headlineSmall: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/registration',
      routes: {
        '/': (context) => const LandingPage(),
        '/full-packages': (context) => const FullPackagesPage(),
        '/visa': (context) => const VisaPage(),
        '/registration': (context) => RegistrationPage(
          packageName: 'Group Umrah Package 2024',  // Pass correct package name
          price: '3000',  // Pass price as string
          numberOfPeople: 5,  // Example number of people
          totalPrice: 15000,  // Example total price
          onComplete: () {
            debugPrint("Registration completed!");  // Handle completion function
          },
        ),
        '/hajj-brochures': (context) => const HajjBrochuresPage(),
        '/tour-guides': (context) => const TourGuidesPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/basic-umrah-package': (context) => const BasicUmrahPage(),
        '/standard-umrah-package': (context) => const StandardUmrahPackagePage(),
        '/premium-umrah-package': (context) => const PremiumUmrahPackagePage(),
        '/basic-hajj-package': (context) => const BasicHajjPage(),
        '/standard-hajj-package': (context) => const StandardHajjPackagePage(),
        '/luxury-hajj-package': (context) => const PremiumHajjPackagePage(),
        '/family-hajj-package': (context) => const FamilyHajjPackagePage(),
        '/group-umrah-package': (context) => const GroupUmrahPackagePage(),
      },
    );
  }
}
