import 'package:flutter/material.dart';

class FullPackagesPage extends StatelessWidget {
  const FullPackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hajj and Umrah Packages"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Umrah Package
            PackageCard(
              packageName: "Basic Umrah Package",
              price: "\$1200",
              description:
                  "Round-trip airfare (economy class),   Accommodation in a 3-star hotel,   Daily breakfast,   Transportation to and from the airport,   Basic visa processing.",
            ),
            SizedBox(height: 16),
            // Standard Umrah Package
            PackageCard(
              packageName: "Standard Umrah Package",
              price: "\$1500",
              description:
                  "Round-trip airfare (business class),Accommodation in a 4-star hotel (shared room),Daily breakfast and dinner,Transportation to and from the airport, Visa processing,Guided tours to key religious sites.",
            ),
            SizedBox(height: 16),
            // Premium Umrah Package
            PackageCard(
              packageName: "Premium Umrah Package",
              price: "\$3000",
              description:
                  "Round-trip airfare (business class), Priority visa processing,Accommodation in Makkah (5-star hotel, private suite), Accommodation in Madinah (5-star hotel, private suite),Gourmet meals (full board),Private luxury transportation for all activities, Dedicated personal guide throughout the pilgrimage, 24/7 health and wellness services.",
            ),
            SizedBox(height: 16),
            // Hajj Package 2024 (Basic)
            PackageCard(
              packageName: "Hajj Package 2024 (Basic)",
              price: "\$3500",
              description:
                  " Round-trip airfare (economy class)',Accommodation in Makkah (3-star hotel),Accommodation in Madinah (3-star hotel), Group transportation to Hajj sites, Basic visa processing, Daily meals (breakfast only)",
            ),
            SizedBox(height: 16),
            // Hajj Package 2024 (Standard)
            PackageCard(
              packageName: "Hajj Package 2024 (Standard)",
              price: "\$5000",
              description:
                  "Round-trip airfare (economy class),Visa processing, Accommodation in Makkah (3-star hotel), Accommodation in Madinah (3-star hotel),Daily meals (breakfast only), Group transportation to Hajj sites,Basic travel insurance',",
            ),
            SizedBox(height: 16),
            // Hajj Package 2024 (Luxury)
            PackageCard(
              packageName: "Hajj Package 2024 (Luxury)",
              price: "\$8000",
              description:
                  " Round-trip airfare (first class), Visa processing, Accommodation in Makkah (5-star hotel, private suite), Accommodation in Madinah (5-star hotel, private suite), Gourmet meals (full board), Private luxury transportation to all Hajj sites,Dedicated personal guide throughout the journey, Comprehensive healthcare and wellness services,24/7 concierge and VIP support services",
            ),
            PackageCard(
              packageName: "Family Hajj Package",
              price: "\$4500",
              description:
                  'Round-trip airfare (economy class), Visa processing ,Accommodation in Makkah (4-star hotel, family room), Accommodation in Madinah (4-star hotel, family room),Daily meals (half board),Family-friendly group transportation to Hajj sites, Childcare services during group activities',
            ),

            PackageCard(
              packageName: "Group Umrah Package",
              price: "\$3000",
              description:
                  '- Round-trip airfare (economy class),Visa processing,Accommodation in Makkah (shared rooms), Accommodation in Madinah (shared rooms),Daily meals (full board),Group transportation to religious sites,Guided group activities',
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String packageName;
  final String price;
  final String description;

  const PackageCard({
    super.key,
    required this.packageName,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              packageName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basic-umrah-package');
              },
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
