import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart'; // Path provider for non-web platforms
import 'package:url_launcher/url_launcher.dart'; // For launching URLs in web

class HajjBrochuresPage extends StatelessWidget {
  const HajjBrochuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Brochures'),
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
          ListTile(
            title: const Text('Hajj Brochure 2024'),
            subtitle: const Text('Detailed Hajj package information and guidelines.'),
            trailing: const Icon(Icons.picture_as_pdf),
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
          ListTile(
            title: const Text('Umrah Brochure 2024'),
            subtitle: const Text('Detailed Umrah package information and guidelines.'),
            trailing: const Icon(Icons.picture_as_pdf),
            onTap: () async {
              final pdfPath = await _loadPdfFromAssets('assets/pdf/umrah-guide.pdf');
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

  Future<String?> _loadPdfFromAssets(String assetPath) async {
    try {
      if (kIsWeb) {
        // Web-specific logic: Open PDF in a browser using a URL launcher
        final url = Uri.base.resolve(assetPath).toString(); // Full URL for the web
        print('Opening PDF directly in browser: $url');
        
        // Use launchUrl with LaunchMode.externalApplication
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
        return null; // No file path to return for web
      } else {
        // Non-web behavior: Load PDF from assets and save to a temporary file
        final byteData = await rootBundle.load(assetPath);
        print("PDF loaded from assets successfully.");

        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/${assetPath.split('/').last}';
        final file = File(filePath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
        print("PDF saved to temporary directory: $filePath");

        return filePath; // Return the file path for non-web
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
