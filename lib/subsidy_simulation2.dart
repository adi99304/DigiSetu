import 'package:flutter/material.dart';

class SubsidySimulation2 extends StatefulWidget {
  const SubsidySimulation2({super.key});

  @override
  _SubsidySimulationState createState() => _SubsidySimulationState();
}

class _SubsidySimulationState extends State<SubsidySimulation2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _showSuccessMessageName = false;
  bool _showSuccessMessageUsername = false;
  bool _showSuccessMessagePassword = false;
  bool _showSuccessMessageConfirmPassword = false;
  int _currentPage = 1;

  void _goToNextPage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _currentPage = 2;
      });
    }
  }

  void _goToPreviousPage() {
    setState(() {
      _currentPage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPage == 1 ? 'Subsidy Simulation 2' : 'Subsidy Simulation 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: _currentPage == 1 ? _buildPage1() : _buildPage2(),
        ),
      ),
    );
  }

  Widget _buildPage1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'नवीन नोंदणी',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const Divider(color: Colors.green, thickness: 1.5),
        const SizedBox(height: 16),

        const Text(
          'Applicant Name *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 4),

        TextFormField(
          controller: _nameController,
          decoration: _inputDecoration(),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Name is required';
            }
            setState(() {
              _showSuccessMessageName = true;
            });
            return null;
          },
        ),

        if (_showSuccessMessageName)
          _successMessage('✅ Name is valid'),

        const SizedBox(height: 20),

        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: _goToNextPage,
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'User Details',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const Divider(color: Colors.green, thickness: 1.5),
        const SizedBox(height: 16),

        // Username Field
        const Text(
          'Username *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 4),

        TextFormField(
          controller: _usernameController,
          decoration: _inputDecoration(),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Username is required';
            }
            if (value.length < 4 || value.length > 15) {
              return 'Username must be 4-15 characters';
            }
            setState(() {
              _showSuccessMessageUsername = true;
            });
            return null;
          },
        ),

        _infoContainer('📌 Note: Username must contain letters & numbers (4-15 characters).'),
        if (_showSuccessMessageUsername)
          _successMessage('✅ Username is valid'),

        const SizedBox(height: 12),

        // Password Field
        const Text(
          'Password *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 4),

        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: _passwordDecoration(),
          validator: (value) {
            if (value == null || value.length < 8 || value.length > 20) {
              return 'Password must be 8-20 characters';
            }
            setState(() {
              _showSuccessMessagePassword = true;
            });
            return null;
          },
        ),

        _infoContainer('📌 Note: Password must contain letters & numbers (8-20 characters).'),
        if (_showSuccessMessagePassword)
          _successMessage('✅ Password is strong'),

        const SizedBox(height: 12),

        // Confirm Password Field
        const Text(
          'Confirm Password *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 4),

        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscurePassword,
          decoration: _passwordDecoration(),
          validator: (value) {
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            setState(() {
              _showSuccessMessageConfirmPassword = true;
            });
            return null;
          },
        ),

        if (_showSuccessMessageConfirmPassword)
          _successMessage('✅ Passwords match'),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _goToPreviousPage,
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form submitted successfully')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.green, width: 1.5)),
      errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red, width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red, width: 1.5)),
    );
  }

  InputDecoration _passwordDecoration() {
    return _inputDecoration().copyWith(
      suffixIcon: IconButton(
        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
    );
  }

  Widget _infoContainer(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.lightGreen[100], borderRadius: BorderRadius.circular(4)),
      child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
    );
  }

  Widget _successMessage(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(text, style: const TextStyle(color: Colors.green, fontSize: 14)),
    );
  }
}
