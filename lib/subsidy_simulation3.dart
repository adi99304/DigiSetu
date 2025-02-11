import 'package:flutter/material.dart';

class SubsidySimulation3 extends StatefulWidget {
  @override
  _SubsidySimulation3State createState() => _SubsidySimulation3State();
}

class _SubsidySimulation3State extends State<SubsidySimulation3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isUsernameValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subsidy Simulation 3')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username Field
              const Text(
                'Username *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                onChanged: (value) {
                  setState(() {
                    _isUsernameValid = value.trim().length >= 4 && value.trim().length <= 15;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  } else if (value.length < 4 || value.length > 15) {
                    return 'Username must be 4-15 characters';
                  }
                  return null;
                },
              ),
              _buildMarathiNote('नोंद: युजर नेम हे अक्षरे व अंकांचा समावेश असलेले असावे तसेच, त्यात किमान ४ व कमाल १५ अक्षरे / अंक असावेत.'),
              const SizedBox(height: 16),

              // Password Field
              const Text(
                'Password *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isPasswordValid = value.length >= 8 && value.length <= 20;
                  });
                },
                validator: (value) {
                  if (value == null || value.length < 8 || value.length > 20) {
                    return 'Password must be 8-20 characters';
                  }
                  return null;
                },
              ),
              _buildMarathiNote('नोंद: पासवर्ड हा अक्षरांचा व अंकांचा समावेश असलेला असावा तसेच, त्यात किमान ८ व कमाल २० अक्षरे / अंक असावेत.'),
              const SizedBox(height: 16),

              // Confirm Password Field
              const Text(
                'Confirm Password *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                onChanged: (value) {
                  setState(() {
                    _isConfirmPasswordValid = value == _passwordController.text;
                  });
                },
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              if (_isConfirmPasswordValid)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    '✅ Passwords match successfully',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ),
              const SizedBox(height: 20),

              // Submit Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form submitted successfully')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the green note below fields
  Widget _buildMarathiNote(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black87, fontSize: 14),
      ),
    );
  }
}
