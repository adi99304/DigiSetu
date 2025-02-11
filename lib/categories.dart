import 'package:flutter/material.dart';
import 'tutorial_page.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Healthcare',
        'icon': Icons.local_hospital,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
      {
        'name': 'Education',
        'icon': Icons.school,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
      {
        'name': 'Finances',
        'icon': Icons.attach_money,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
      {
        'name': 'Social Media',
        'icon': Icons.people,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
      {
        'name': 'Technology',
        'icon': Icons.computer,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
      // {
      //   'name': 'Government Services',
      //   'icon': Icons.account_balance,
      //   'courses': ['Course 1', 'Course 2', 'Course 3']
      // },
      {
        'name': 'Online Safety',
        'icon': Icons.security,
        'courses': ['Course 1', 'Course 2', 'Course 3']
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Stack(
        children: [
          // Gradient Background

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorialPage(
                          categoryName: categories[index]['name'] as String,
                          courses: categories[index]['courses'] as List<String>,
                        ),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(3, 3),
                        ),
                      ],
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(categories[index]['icon'] as IconData?,
                            size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          categories[index]['name'] as String,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
