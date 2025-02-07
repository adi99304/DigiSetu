import 'package:flutter/material.dart';
import 'main.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Categories Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
    );
  }
}
