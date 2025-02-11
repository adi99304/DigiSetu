import 'package:flutter/material.dart';

class UPICheckBalanceScreen extends StatefulWidget {
  const UPICheckBalanceScreen({super.key});

  @override
  State<UPICheckBalanceScreen> createState() => _UPICheckBalanceScreenState();
}

class _UPICheckBalanceScreenState extends State<UPICheckBalanceScreen> {
  int currentStep = 0;
  String balance = "******";
  String enteredPin = "";
  bool isPinEntered = false;
  bool isLoading = false;

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    }
  }

  void verifyUPIPin() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        isPinEntered = true;
        balance = "₹5,320.75"; // Mock balance
      });
    });
  }

  void _onKeyPressed(String value) {
    setState(() {
      if (value == "⌫") {
        if (enteredPin.isNotEmpty) {
          enteredPin = enteredPin.substring(0, enteredPin.length - 1);
        }
      } else if (enteredPin.length < 4) {
        enteredPin += value;
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Check UPI Balance'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Follow the steps to check your UPI balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            _buildStepTile("Open UPI App", "Tap to simulate opening UPI app.", Icons.phone_android, nextStep, 0),
            _buildStepTile("Go to Bank Balance Section", "Tap on 'Check Balance' option.", Icons.account_balance_wallet, nextStep, 1),
            _buildStepTile("Select Bank Account", "Choose your linked bank account.", Icons.account_balance, nextStep, 2),
            _buildStepTile("Enter UPI PIN", "Enter your secure UPI PIN.", Icons.lock, () => showUPIPinDialog(context), 3),
            if (isPinEntered) _buildBalanceDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTile(String title, String description, IconData icon, VoidCallback onTap, int step) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: currentStep >= step ? Colors.deepPurple[50] : Colors.white,
      child: ListTile(
        leading: Icon(icon, color: currentStep >= step ? Colors.deepPurple : Colors.grey, size: 30),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        subtitle: Text(description, style: const TextStyle(fontSize: 14)),
        trailing: currentStep == step
            ? ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: const Text("Tap Here"),
        )
            : Icon(Icons.check_circle, color: currentStep > step ? Colors.green : Colors.grey),
      ),
    );
  }

  Widget _buildBalanceDisplay() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)],
        ),
        child: Column(
          children: [
            const Text("Your Account Balance:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(balance, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ),
    );
  }

  void showUPIPinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter UPI PIN"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      color: index < enteredPin.length ? Colors.black : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var i = 1; i <= 9; i++) _buildKeypadButton(i.toString()),
                  const SizedBox.shrink(),
                  _buildKeypadButton("0"),
                  _buildKeypadButton("⌫"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (enteredPin.length == 4) {
                    Navigator.pop(context);
                    verifyUPIPin();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text("Confirm"),
              ),
            ],
          ),
        );
      },
    );
  }
}
