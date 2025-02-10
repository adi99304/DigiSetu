import 'package:flutter/material.dart';

class UPICheckHistoryScreen extends StatelessWidget {
  const UPICheckHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Transaction History'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'How to Check Transaction History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '1. Open your UPI app.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '2. Go to the "History" section.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '3. Select the date range to view transactions.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '4. View the details of each transaction.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}