// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/full_packages_page.dart';
import 'package:flutter_application_1/pages/visa_page.dart';
import 'package:flutter_application_1/pages/hajj_brochures_page.dart';
import 'package:flutter_application_1/pages/tour_guides_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holy Voyage Kenya'),
        backgroundColor: const Color.fromARGB(255, 99, 180, 221),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildGridButton(
                context, 'Full Packages', Icons.card_travel, '/full-packages'),
            _buildGridButton(context, 'Visa', Icons.public, '/visa'),
            _buildGridButton(
                context, 'Hajj Brochures', Icons.book, '/hajj-brochures'),
            _buildGridButton(
                context, 'Tour Guides', Icons.person, '/tour-guides'),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, String label, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}