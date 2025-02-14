// Updated Authentication Screens with Supabase (Username, Password)
// Fixes 'Invalid Credentials' issue by using proper authentication.

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

final supabase = Supabase.instance.client;
const tableName = 'profiles';

String hashPassword(String password) {
  return sha256.convert(utf8.encode(password)).toString();
}

// Registration Screen
class RegistrationPage extends StatelessWidget {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerUser() async {
    try {
      final response = await supabase.from(tableName).insert({
        'name': nameController.text,
        'username': usernameController.text,
        'password': hashPassword(passwordController.text),
      });
      print('Registration Successful: ${response.toString()}');
    } catch (e) {
      print('Registration Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name')),
            TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username')),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await registerUser();
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}

// Login Screen
class LoginPage1 extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .eq('username', usernameController.text)
          .eq('password', hashPassword(passwordController.text))
          .maybeSingle();
      if (response != null) {
        print('Login Successful: ${response.toString()}');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print('Invalid Credentials');
      }
    } catch (e) {
      print('Login Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username')),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await loginUser(context);
                },
                child: Text('Login')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: Text('Don\'t have an account? Register')),
          ],
        ),
      ),
    );
  }
}
