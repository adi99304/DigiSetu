import 'package:flutter/material.dart';
import 'upi_pin.dart';

class UPIAmountScreen extends StatelessWidget {
  final String upiId;
  const UPIAmountScreen({super.key, required this.upiId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Amount'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "How much do you want to send?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              "To: $upiId",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _amountController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: '₹0',
                hintStyle: TextStyle(fontSize: 28, color: Colors.grey),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: [100, 500, 1000, 2000].map((amount) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _amountController.text = amount.toString();
                  },
                  child: Text("₹$amount"),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (_amountController.text.isEmpty ||
                    double.tryParse(_amountController.text) == null ||
                    double.parse(_amountController.text) <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid amount'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UPIPinScreen(
                      upiId: upiId,
                      amount: _amountController.text,
                    ),
                  ),
                );
              },
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
