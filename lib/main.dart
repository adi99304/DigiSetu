import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'splash.dart'; // Import the splash screen
import 'categories.dart';
import 'profile.dart';
import 'login.dart'; // Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Set the initial route to the splash screen
      routes: {
        '/splash': (context) =>
            SplashScreen(), // Define the splash screen route
        '/': (context) => LoginPage(), // Define the login page route
        '/home': (context) => HomeScreen(), // Define the home screen route
        '/categories': (context) => CategoriesPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/categories');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                autofocus: true,
              )
            : Row(
                children: [
                  Text(
                    "DigiSetu",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.search, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              'Search...',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        backgroundColor: Colors.white,
        actions: _isSearching
            ? [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchController.clear();
                    });
                  },
                ),
              ]
            : null,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text('Leaderboard'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Courses'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/categories');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About us'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/categories');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
      body: HomePage(),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 30,
                child: Text(
                  "Popular courses",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 200,
            child: CarouselSlider(
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
                      "Slide ${index + 1}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 150,
                          child: Center(child: Text("Category ${index + 1}")),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Popular Courses",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 150,
                          child: Center(child: Text("Course ${index + 1}")),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "YouTube Tutorials",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 150,
                          child: Center(child: Text("Tutorial ${index + 1}")),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Add your chatbot or help functionality here
                },
                child: Icon(Icons.chat),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
