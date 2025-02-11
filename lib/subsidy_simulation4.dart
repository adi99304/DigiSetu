import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:animate_do/animate_do.dart';

class SubsidySimulation4 extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<SubsidySimulation4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool showError = false;
  bool showTutorial = true;
  bool showDemo = true;

  final GlobalKey _emailKey = GlobalKey();
  final GlobalKey _emailOTPKey = GlobalKey();
  final GlobalKey _mobileKey = GlobalKey();
  final GlobalKey _mobileOTPKey = GlobalKey();
  final GlobalKey _submitKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (showDemo) {
        _playDemo();
      }
    });
  }

  void _playDemo() async {
    await Future.delayed(Duration(seconds: 1));
    ShowCaseWidget.of(context)?.startShowCase([
      _emailKey,
      _emailOTPKey,
      _mobileKey,
      _mobileOTPKey,
      _submitKey,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Verification Page"),
          actions: [
            if (showTutorial)
              TextButton(
                onPressed: () {
                  setState(() => showTutorial = false);
                  ShowCaseWidget.of(context).dismiss();
                },
                child: Text("Skip", style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BounceInDown(
                  child: Showcase(
                    key: _emailKey,
                    description:
                        "Enter your Email ID. This should be a valid email.",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email ID", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: _emailController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                FadeInLeft(
                  child: Showcase(
                    key: _emailOTPKey,
                    description: "Click to receive OTP for email verification.",
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Get OTP for Email",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (showError)
                  FadeIn(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.red[100],
                      child: Row(
                        children: [
                          Icon(Icons.info, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Note: Mobile number verification is mandatory.",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 8),
                BounceInRight(
                  child: Showcase(
                    key: _mobileKey,
                    description: "Enter your 10-digit Mobile Number.",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile Number *", style: TextStyle(fontSize: 16)),
                        TextFormField(
                          controller: _mobileController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile number is required';
                            }
                            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return 'Enter a valid 10-digit mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.blue[100],
                          child: Row(
                            children: [
                              Icon(Icons.info, color: Colors.blue),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Please enter your phone number for verification.",
                                  style: TextStyle(color: Colors.blue[900]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                FadeInRight(
                  child: Showcase(
                    key: _mobileOTPKey,
                    description:
                        "Click to receive OTP for mobile verification.",
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showError = _mobileController.text.isEmpty;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Get OTP for Mobile",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                BounceInUp(
                  child: Showcase(
                    key: _submitKey,
                    description: "Click to submit your details.",
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Form submitted successfully')),
                          );
                          Navigator.of(context)
                              .pushReplacementNamed('/subsidy5');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text('Submit',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
