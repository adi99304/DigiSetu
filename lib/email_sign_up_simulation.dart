// import 'package:flutter/material.dart';
//
// // void main() {
// //   runApp(DigiSetuEmailSignup());
// // }
//
// class DigiSetuEmailSignup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SignupModeSelection(),
//     );
//   }
// }
//
// class SignupModeSelection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Email Account Creation")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Choose Signup Mode", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => GuidedSignup()));
//               },
//               child: Text("Guided Mode"),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => FreeExplorationSignup()));
//               },
//               child: Text("Free Exploration Mode"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class GuidedSignup extends StatefulWidget {
//   @override
//   _GuidedSignupState createState() => _GuidedSignupState();
// }
//
// class _GuidedSignupState extends State<GuidedSignup> {
//   int _currentStep = 0;
//   final _formKey = GlobalKey<FormState>();
//   String _username = "";
//   String _email = "";
//   String _password = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Guided Signup")),
//       body: Stepper(
//         currentStep: _currentStep,
//         onStepContinue: () {
//           if (_currentStep < 2) {
//             setState(() {
//               _currentStep++;
//             });
//           } else {
//             if (_formKey.currentState!.validate()) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Complete!")));
//             }
//           }
//         },
//         onStepCancel: () {
//           if (_currentStep > 0) {
//             setState(() {
//               _currentStep--;
//             });
//           }
//         },
//         steps: [
//           Step(
//             title: Text("Username"),
//             content: TextFormField(
//               onChanged: (value) => _username = value,
//               decoration: InputDecoration(labelText: "Enter Username"),
//               validator: (value) => value!.isEmpty ? "Username cannot be empty" : null,
//             ),
//           ),
//           Step(
//             title: Text("Email"),
//             content: TextFormField(
//               onChanged: (value) => _email = value,
//               decoration: InputDecoration(labelText: "Enter Email"),
//               validator: (value) => !value!.contains("@") ? "Enter a valid email" : null,
//             ),
//           ),
//           Step(
//             title: Text("Password"),
//             content: TextFormField(
//               onChanged: (value) => _password = value,
//               decoration: InputDecoration(labelText: "Enter Password"),
//               obscureText: true,
//               validator: (value) => value!.length < 6 ? "Password too short" : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// //
// //
// // import 'package:flutter/material.dart';
// //
// // class DigiSetuEmailSignup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: SignupModeSelection(),
// //     );
// //   }
// // }
// //
// // class SignupModeSelection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Email Account Creation")),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text("Choose Signup Mode", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => GuidedSignup()));
// //               },
// //               child: Text("Guided Mode"),
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => FreeExplorationSignup()));
// //               },
// //               child: Text("Free Exploration Mode"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// // class FreeExplorationSignup extends StatefulWidget {
// //   @override
// //   _FreeExplorationSignupState createState() => _FreeExplorationSignupState();
// // }
// //
// // class _FreeExplorationSignupState extends State<FreeExplorationSignup> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _username = "";
// //   String _email = "";
// //   String _password = "";
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Free Exploration Signup")),
// //       body: Form(
// //         key: _formKey,
// //         child: Padding(
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: "Username"),
// //                 onChanged: (value) => _username = value,
// //                 validator: (value) => value!.isEmpty ? "Username cannot be empty" : null,
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: "Email"),
// //                 onChanged: (value) => _email = value,
// //                 validator: (value) => !value!.contains("@") ? "Enter a valid email" : null,
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: "Password"),
// //                 onChanged: (value) => _password = value,
// //                 obscureText: true,
// //                 validator: (value) => value!.length < 6 ? "Password too short" : null,
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Successful!")));
// //                   }
// //                 },
// //                 child: Text("Submit"),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class GuidedSignup extends StatefulWidget {
// //   @override
// //   _GuidedSignupState createState() => _GuidedSignupState();
// // }
// //
// // class _GuidedSignupState extends State<GuidedSignup> {
// //
// //   int _currentStep = 0;
// //   final _formKey = GlobalKey<FormState>();
// //   String _username = "";
// //   String _email = "";
// //   String _password = "";
// //   String _confirmPassword = "";
// //
// //   bool _validateUsername(String value) {
// //     return RegExp(r'^[a-zA-Z0-9_]{5,}\$').hasMatch(value);
// //   }
// //
// //   bool _validatePassword(String value) {
// //     return value.length >= 8 &&
// //         value.contains(RegExp(r'[A-Z]')) &&
// //         value.contains(RegExp(r'[0-9]')) &&
// //         value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Guided Signup")),
// //       body: Form(
// //         key: _formKey,
// //         child: Stepper(
// //           type: StepperType.vertical,
// //           currentStep: _currentStep,
// //           onStepContinue: () {
// //             if (_currentStep < 3) {
// //               setState(() {
// //                 _currentStep++;
// //               });
// //             } else {
// //               if (_formKey.currentState!.validate()) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text("Signup Complete!"))
// //                 );
// //               }
// //             }
// //           },
// //           onStepCancel: () {
// //             if (_currentStep > 0) {
// //               setState(() {
// //                 _currentStep--;
// //               });
// //             }
// //           },
// //           steps: [
// //             Step(
// //               title: Text("Username"),
// //               content: TextFormField(
// //                 onChanged: (value) => _username = value,
// //                 decoration: InputDecoration(labelText: "Enter Username"),
// //                 validator: (value) =>
// //                 _validateUsername(value!) ? null : "Username must be at least 5 characters and contain only letters, numbers, or underscores.",
// //               ),
// //             ),
// //             Step(
// //               title: Text("Email"),
// //               content: TextFormField(
// //                 onChanged: (value) => _email = value,
// //                 decoration: InputDecoration(labelText: "Enter Email"),
// //                 validator: (value) =>
// //                 EmailValidator.validate(value: '') && value!.endsWith("@gmail.com") ? null : "Enter a valid Gmail address.",
// //               ),
// //             ),
// //             Step(
// //               title: Text("Password"),
// //               content: TextFormField(
// //                 onChanged: (value) => _password = value,
// //                 decoration: InputDecoration(labelText: "Enter Password"),
// //                 obscureText: true,
// //                 validator: (value) =>
// //                 _validatePassword(value!) ? null : "Password must be 8+ chars, include a number, uppercase, and special char.",
// //               ),
// //             ),
// //             Step(
// //               title: Text("Confirm Password"),
// //               content: TextFormField(
// //                 onChanged: (value) => _confirmPassword = value,
// //                 decoration: InputDecoration(labelText: "Confirm Password"),
// //                 obscureText: true,
// //                 validator: (value) => value == _password ? null : "Passwords do not match.",
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // lib/utils/validators.dart
// //
// // class EmailValidator {
// //   /// Validates the email format
// //   static bool isValidEmail(String email) {
// //     final RegExp emailRegex = RegExp(
// //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
// //     );
// //     return emailRegex.hasMatch(email);
// //   }
// //
// //   /// Returns an error message if the email is invalid, otherwise returns null
// //   static String? validateEmail(String? email) {
// //     if (email == null || email.isEmpty) {
// //       return "Email cannot be empty";
// //     } else if (!isValidEmail(email)) {
// //       return "Enter a valid email address";
// //     }
// //     return null;
// //   }
// //
// //   /// Generic validation method (can be expanded later)
// //   static String? validate({required String? value, required String fieldType}) {
// //     if (value == null || value.isEmpty) {
// //       return "$fieldType cannot be empty";
// //     }
// //
// //     if (fieldType == "Email" && !isValidEmail(value)) {
// //       return "Enter a valid email address";
// //     }
// //
// //     return null; // Return null if validation passes
// //   }
// // }
//
