import 'package:flutter/material.dart';

class UPICheckUPIIDScreen extends StatelessWidget {
  const UPICheckUPIIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check UPI ID'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'How to Check Your UPI ID',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '1. Open your UPI app.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '2. Go to the "Profile" section.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '3. Your UPI ID will be displayed under your profile information.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}