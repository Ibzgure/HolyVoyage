import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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
            onTap: () {
              _showOptions(
                context, // Pass context here
                'Hajj Brochure 2024',
                'assets/pdf/hajj-guide.pdf',
              );
            },
          ),
          ListTile(
            title: const Text('Umrah Brochure 2024'),
            subtitle: const Text('Detailed Umrah package information and guidelines.'),
            trailing: const Icon(Icons.picture_as_pdf),
            onTap: () {
              _showOptions(
                context, // Pass context here
                'Umrah Brochure 2024',
                'assets/pdf/umrah-guide.pdf',
              );
            },
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context, String brochureName, String assetPath) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.download),
                title: const Text('Download PDF'),
                onTap: () async {
                  Navigator.pop(context);
                  await _downloadPdf(context, brochureName, assetPath); // Pass context here
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Send to Email'),
                onTap: () async {
                  Navigator.pop(context);
                  await _sendPdfByEmail(context, brochureName, assetPath); // No context needed
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _downloadPdf(BuildContext context, String fileName, String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath); // Load PDF from assets
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName.pdf';
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List()); // Save PDF to local storage

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download PDF: $e')),
      );
    }
  }

  Future<void> _sendPdfByEmail(BuildContext context, String subject, String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath); // Load PDF from assets
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$subject.pdf';
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List()); // Save PDF to local storage

      final email = Email(
        body: 'Please find the brochure attached.',
        subject: subject,
        recipients: ['user@example.com'], // Replace with dynamic email from login
        attachmentPaths: [filePath],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sent successfully'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3), // Optional
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send email: ${e.toString()}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red, // Optional for error indication
        ),
      );
    }
  }
}
