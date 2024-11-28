import 'package:flutter/material.dart';

class TourGuidesPage extends StatelessWidget {
  const TourGuidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guides'),
        backgroundColor: Colors.teal[700],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Guide 1 - Abdul Rahman'),
            subtitle:
                const Text('Expert in Hajj tours with 10 years of experience.'),
            trailing: const Icon(Icons.person),
            onTap: () {
              // Code for further details about the guide
            },
          ),
          ListTile(
            title: const Text('Guide 2 - Fatima Ali'),
            subtitle: const Text('Specialist in women-led Umrah groups.'),
            trailing: const Icon(Icons.person),
            onTap: () {
              // Code for further details about the guide
            },
          ),
        ],
      ),
    );
  }
}
