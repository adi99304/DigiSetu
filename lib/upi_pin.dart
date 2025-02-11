import 'package:flutter/material.dart';

class UPIPinScreen extends StatefulWidget {
  final String upiId;
  final String amount;
  const UPIPinScreen({super.key, required this.upiId, required this.amount});

  @override
  _UPIPinScreenState createState() => _UPIPinScreenState();
}

class _UPIPinScreenState extends State<UPIPinScreen> {
  String _enteredPin = "";

  void _simulateTransaction() {
    if (_enteredPin.length < 4) {
      _showPopup("Please enter a valid 4-digit UPI PIN.", Colors.orange);
      return;
    }

    bool isSuccess = _enteredPin == '1112';
    _showPopup(isSuccess ? 'Transaction Successful!' : 'Transaction Failed! Incorrect PIN.',
        isSuccess ? Colors.green : Colors.red);
  }

  void _showPopup(String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message, style: TextStyle(color: color)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (message.contains("Successful")) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onKeyPressed(String value) {
    setState(() {
      if (value == "⌫") {
        if (_enteredPin.isNotEmpty) {
          _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
        }
      } else if (_enteredPin.length < 4) {
        _enteredPin += value;
      }
    });
  }

  Widget _buildKeypadButton(String text) {
    return GestureDetector(
      onTap: () => _onKeyPressed(text),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter UPI PIN'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Confirm ₹${widget.amount} Payment",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "To: ${widget.upiId}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Text(
              "Enter your UPI PIN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < _enteredPin.length ? Colors.black : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var i = 1; i <= 9; i++) _buildKeypadButton(i.toString()),
                const SizedBox.shrink(),
                _buildKeypadButton("0"),
                _buildKeypadButton("⌫"),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _simulateTransaction,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Pay ₹${widget.amount}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
