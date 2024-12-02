import 'package:flutter/material.dart';

class TourGuidesPage extends StatelessWidget {
  const TourGuidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guides'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/landing'); // Navigate back to LandingPage
          },
        ),
      ),
      body: ListView(
        children: [
          _buildGuideTile(
            context,
            'Guide 1 - Abdul Rahman',
            'Expert in Hajj tours with 10 years of experience.',
            'Languages: Arabic, English\nContact: +123 456 789\nEmail: abdul.rahman@gmail.com',
          ),
          _buildGuideTile(
            context,
            'Guide 2 - Fatima Ali',
            'Specialist in women-led Umrah groups.',
            'Languages: Arabic, English, Urdu\nContact: +987 654 321\nEmail: fatima.ali@gmail.com',
          ),
          _buildGuideTile(
            context,
            'Guide 3 - Ahmed Khan',
            'Over 15 years of experience leading pilgrimage groups.',
            'Languages: Arabic, English, Hindi\nContact: +111 222 333\nEmail: ahmed.khan@gmail.com',
          ),
          _buildGuideTile(
            context,
            'Guide 4 - Aisha Mohammed',
            'Expert in family-oriented Hajj and Umrah tours.',
            'Languages: Arabic, English, Swahili\nContact: +444 555 666\nEmail: aisha.mohammed@gmail.com',
          ),
          _buildGuideTile(
            context,
            'Guide 5 - Mohammed Yusuf',
            'Specializes in VIP and customized Hajj experiences.',
            'Languages: Arabic, English, French\nContact: +777 888 999\nEmail: mohammed.yusuf@gmail.com',
          ),
        ],
      ),
    );
  }

  Widget _buildGuideTile(BuildContext context, String name, String description, String additionalInfo) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      trailing: const Icon(Icons.person),
      onTap: () {
        _showGuideDetails(context, name, description, additionalInfo);
      },
    );
  }

  void _showGuideDetails(BuildContext context, String name, String description, String additionalInfo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(additionalInfo),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
