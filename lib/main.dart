import 'package:digisetu/email_sign_up_simulation.dart';
import 'package:digisetu/email_simulation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'splash.dart';
import 'categories.dart';
import 'profile.dart';
import 'login.dart';
import 'subsidy_simulation1.dart';
import 'subsidy_simulation2.dart' as sim2;
import 'subsidy_simulation3.dart';
import 'upi_tutorial.dart';
import 'upi_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        // '/categories': (context) => CategoriesPage(),
        '/profile': (context) => ProfilePage(),
        '/subsidy': (context) => SubsidySimulation(),
        '/subsidy2': (context) => const sim2.SubsidySimulation2(),
        // '/email_tutorial': (context) => EmailTutorial(), // Added Email Tutorial Route
        // '/email_tutorial': (context) => EmailTutorial(),
        '/email_simulation': (context) =>
            EmailSimulation(), // Register new route
        '/upi_tutorial': (context) =>
            const UPITutorialScreen(), // Define UPI tutorial screen route
        '/upi': (context) =>
            const UPISelectionScreen(), // Define UPI selection screen route
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
        Navigator.pushReplacementNamed(context, '/home');
        break;
      // case 1:
      //   Navigator.pushReplacementNamed(context, '/categories');
      //   break;
      case 1:
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Courses'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                // Navigator.pushReplacementNamed(context, '/categories');
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
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Subsidy Simulation'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/subsidy');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('UPI'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/upi');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email Simulation'), // Added Email Tutorial Option
              onTap: () {
                Navigator.pushReplacementNamed(context, '/email_simulation');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                  'Email Sign-Up Simulation'), // Added Email Tutorial Option
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/email_sign_up_simulation');
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.category),
          //   label: 'Categories',
          // ),
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

// Email Tutorial Screen
// class EmailTutorial extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Email Tutorial"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.email, size: 100, color: Colors.blue),
//               SizedBox(height: 20),
//               Text(
//                 "Learn how to send and receive emails!",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add an interactive tutorial here
//                 },
//                 child: Text("Start Tutorial"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
