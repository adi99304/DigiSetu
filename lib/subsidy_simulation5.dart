import 'package:flutter/material.dart';
import 'dart:math';

class SubsidySimulation5 extends StatefulWidget {
  @override
  _SubsidySimulation5State createState() => _SubsidySimulation5State();
}

class _SubsidySimulation5State extends State<SubsidySimulation5> {
  final TextEditingController _captchaController = TextEditingController();
  late String _generatedCaptcha;

  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }

  void _generateCaptcha() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final random = Random();
    setState(() {
      _generatedCaptcha = String.fromCharCodes(
        Iterable.generate(5, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
      );
    });
  }

  void _validateCaptcha() {
    if (_captchaController.text.trim().toUpperCase() == _generatedCaptcha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CAPTCHA Verified Successfully ✅')),
      );

      // Wait for 1 second before navigating to the home page
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/home');
      });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect CAPTCHA ❌. Please try again.')),
      );
      _generateCaptcha();
      _captchaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('CAPTCHA Verification / कॅप्चा सत्यापन', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _instructionCard(),
            const SizedBox(height: 16),
            _captchaBox(),
            const SizedBox(height: 16),
            _buttonsRow(),
          ],
        ),
      ),
    );
  }

  Widget _instructionCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'How to Fill CAPTCHA / कॅप्चा कसा भरावा',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 6),
          Text(
            '1️⃣ Look at the blue letters above.\n2️⃣ Type the same letters in the box below.\n3️⃣ Press "Verify".\n\n१️⃣ वरील निळ्या अक्षरे काळजीपूर्वक पहा.\n२️⃣ तीच अक्षरे खालील बॉक्समध्ये टाका.\n३️⃣ "सत्यापित करा" वर क्लिक करा.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _captchaBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.blue[50],
              child: Text(
                _generatedCaptcha,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: _generateCaptcha,
            child: Text('🔄 Refresh / रिफ्रेश करा', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  Widget _buttonsRow() {
    return Column(
      children: [
        TextField(
          controller: _captchaController,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Enter CAPTCHA / कॅप्चा टाका',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: _validateCaptcha,
              child: const Text('Verify / सत्यापित करा', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Back / मागे', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ],
    );
  }
}
