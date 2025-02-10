import 'package:flutter/material.dart';
import 'upi_amount.dart';

class UPISelectionScreen extends StatelessWidget {
  const UPISelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _upiIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Payment'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // UPI Icon
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.account_balance_wallet, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 10),

            const Text(
              'Enter UPI ID or Scan QR Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // UPI ID Input Field
            TextField(
              controller: _upiIdController,
              decoration: InputDecoration(
                labelText: 'UPI ID',
                hintText: 'e.g., beneficiary@bank',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.purple),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            // Scan QR Code Button
            OutlinedButton.icon(
              onPressed: () {
                // Implement QR code scanning functionality
              },
              icon: const Icon(Icons.qr_code_scanner, color: Colors.purple),
              label: const Text('Scan QR Code', style: TextStyle(color: Colors.purple)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                side: const BorderSide(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 20),

            // Tutorial Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('📌 How to Pay Using UPI',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                  SizedBox(height: 5),
                  Text('1️⃣ Enter or scan the UPI ID of the recipient.', style: TextStyle(fontSize: 14)),
                  Text('2️⃣ Tap "Next" and enter the amount.', style: TextStyle(fontSize: 14)),
                  Text('3️⃣ Choose your bank and confirm the payment.', style: TextStyle(fontSize: 14)),
                  Text('4️⃣ Enter your UPI PIN to complete the transaction.', style: TextStyle(fontSize: 14)),
                  Text('✅ Done! Your payment will be processed instantly.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UPIAmountScreen(upiId: _upiIdController.text),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
