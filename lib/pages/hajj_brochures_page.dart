import 'package:flutter/material.dart';
//import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class HajjBrochuresPage extends StatelessWidget {
  const HajjBrochuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Brochures'),
        backgroundColor: Colors.teal[700],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Hajj Brochure 2024'),
            subtitle:
                const Text('Detailed Hajj package information and guidelines.'),
            trailing: const Icon(Icons.picture_as_pdf),
            onTap: () {
              //Navigator.push(
              //context,
              //MaterialPageRoute(
              //builder: (context) => PDFViewerScaffold(
              //appBar: AppBar(title: const Text('Hajj Brochure 2024')),
              //path: 'assets/pdf/hajj-guide.pdf',
              //),
              //),
              //);
            },
          ),
          ListTile(
            title: const Text('Umrah Brochure 2024'),
            subtitle: const Text(
                'Detailed Umrah package information and guidelines.'),
            trailing: const Icon(Icons.picture_as_pdf),
            onTap: () {
              //Navigator.push(
              // context,
              //MaterialPageRoute(
              //builder: (context) => PDFViewerScaffold(
              //appBar: AppBar(title: const Text('Umrah Brochure 2024')),
              // path: 'assets/pdf/umrah-guide.pdf',
              //),
              // ),
              //);
            },
          ),
        ],
      ),
    );
  }
}
