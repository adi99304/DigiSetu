import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'upi_check_balance.dart';
import 'upi_check_history.dart';
import 'upi_check_upi_id.dart';
import 'upi_selection.dart';

class UPITutorialScreen extends StatelessWidget {
  const UPITutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Soft background for a premium feel
      appBar: AppBar(
        title: const Text(
          'UPI Tutorial',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            _buildStepTile(
              context,
              stepNumber: 1,
              title: 'Check Your Balance',
              icon: Icons.account_balance_wallet,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UPICheckBalanceScreen()),
              ),
              hintText: 'Tap here to check balance!',
            ),
            _buildStepTile(
              context,
              stepNumber: 2,
              title: 'View Transaction History',
              icon: Icons.history,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UPICheckHistoryScreen()),
              ),
              hintText: 'Tap here to view history!',
            ),
            _buildStepTile(
              context,
              stepNumber: 3,
              title: 'Find Your UPI ID',
              icon: Icons.person,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UPICheckUPIIDScreen()),
              ),
              hintText: 'Tap here to check your UPI ID!',
            ),

            const Spacer(),

            Pulse(
              duration: const Duration(seconds: 1),
              infinite: true,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UPISelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.deepPurple,
                    elevation: 8,
                  ),
                  child: const Text(
                    'Proceed to UPI Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTile(BuildContext context, {required int stepNumber, required String title, required IconData icon, required VoidCallback onTap, required String hintText}) {
    return FadeInLeft(
      duration: Duration(milliseconds: 400 + (stepNumber * 150)), // Staggered fade-in for smooth effect
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Text(
              stepNumber.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          subtitle: Text(hintText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          trailing: Icon(icon, color: Colors.deepPurple, size: 30),
          onTap: onTap,
        ),
      ),
    );
  }
}
