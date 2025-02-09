import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubsidySimulation extends StatelessWidget {
  const SubsidySimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subsidy Simulation 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ensure this image exists in assets and is added to pubspec.yaml
          Expanded(
            child: Center(
              child: Image.asset('assets/img.png', fit: BoxFit.cover), // Image fits to page
            ),
          ),
          const SizedBox(height: 20),

          // Buttons section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _launchURL,
                  child: const Text('Go to Registration/Login'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/subsidy2'); // Navigate using named route
                  },
                  child: const Text('Go to Subsidy Simulation 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://mahadbt.maharashtra.gov.in/Farmer/RegistrationLogin/RegistrationLogin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SubsidySimulation(),
  ));
}
