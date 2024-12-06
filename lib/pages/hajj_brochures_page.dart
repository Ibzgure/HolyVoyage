import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore Integration
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HajjBrochuresPage extends StatefulWidget {
  const HajjBrochuresPage({super.key});

  @override
  _HajjBrochuresPageState createState() => _HajjBrochuresPageState();
}

class _HajjBrochuresPageState extends State<HajjBrochuresPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isBooked = false; // Tracks if the package is booked

  @override
  void initState() {
    super.initState();
    _checkBookingStatus(); // Check package booking status on page load
  }

  Future<void> _checkBookingStatus() async {
    try {
      // Query Firestore for the package booking status
      final querySnapshot = await _firestore
          .collection('payments') // Replace with your Firestore collection name
          .where('packageName', isEqualTo: 'Hajj Premium') // Specific package
          .limit(1) // Check if at least one payment exists
          .get();

      setState(() {
        isBooked = querySnapshot.docs.isNotEmpty;
      });
    } catch (e) {
      print('Error checking booking status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Brochures'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/landing');
          },
        ),
      ),
      body: ListView(
        children: [
          // Hajj Brochure Item
          ListTile(
            title: const Text('Hajj Premium Package'),
            subtitle: const Text('Detailed Hajj package information and guidelines.'),
            trailing: ElevatedButton(
              onPressed: isBooked ? null : _bookPackage,
              style: ElevatedButton.styleFrom(
                backgroundColor: isBooked ? Colors.green : Colors.blue,
              ),
              child: Text(isBooked ? 'Booked' : 'Book Now'),
            ),
            onTap: () async {
              final pdfPath = await _loadPdfFromAssets('assets/pdf/hajj-guide.pdf');
              if (pdfPath != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PDFViewerPage(pdfPath: pdfPath)),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _bookPackage() async {
    try {
      // Simulate a booking process and save data to Firestore
      await _firestore.collection('payments').add({
        'packageName': 'Hajj Premium',
        'price': 2000, // Example price
        'userId': 'exampleUserId', // Replace with actual user ID
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        isBooked = true; // Update UI
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Package successfully booked!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking failed: $e')),
      );
    }
  }

  Future<String?> _loadPdfFromAssets(String assetPath) async {
    try {
      if (kIsWeb) {
        // Web-specific logic
        final url = Uri.base.resolve(assetPath).toString();
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
        return null;
      } else {
        // Load PDF for mobile/desktop platforms
        final byteData = await rootBundle.load(assetPath);
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/${assetPath.split('/').last}';
        final file = File(filePath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
        return filePath;
      }
    } catch (e) {
      print('Error loading PDF: $e');
      return null;
    }
  }
}

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;

  const PDFViewerPage({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PDFView(
        filePath: pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load PDF: $error')),
          );
        },
        onPageError: (page, error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error on page $page: $error')),
          );
        },
      ),
    );
  }
}
