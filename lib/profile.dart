import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'John Doe';
  double _salary = 120000;
  String _gender = 'Male';
  String _occupation = 'Software Engineer';
  bool _isEditingOccupation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Add your profile image here
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                      child: Text(
                        _name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showEditNameDialog();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isEditingOccupation = hasFocus;
                    });
                  },
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Occupation',
                      border: _isEditingOccupation
                          ? OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            )
                          : InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _occupation = value;
                      });
                    },
                    controller: TextEditingController(text: _occupation),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.currency_rupee, color: Colors.green),
                title: Text('Salary'),
                subtitle: Slider(
                  value: _salary,
                  min: 0,
                  max: 200000,
                  divisions: 100,
                  label: _salary.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _salary = value;
                    });
                  },
                ),
                trailing: Text('Rs.${_salary.round()} per year'),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Gender'),
                subtitle: DropdownButton<String>(
                  value: _gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              Text(
                'Recommended Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Course ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                'Watchlist',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Watchlist Item ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/categories');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  void _showEditNameDialog() {
    TextEditingController nameController = TextEditingController(text: _name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              Colors.lightBlue[50], // Set the background color to blue
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text('Edit Name', style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.blue),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _name = nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
