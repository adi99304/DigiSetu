import 'package:digisetu/categories.dart';
import 'package:digisetu/chatbot_page.dart';
import 'package:digisetu/email_sign_up_simulation.dart';
import 'package:digisetu/email_simulation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'splash.dart';
import 'package:digisetu/tutorial_page.dart';
import 'profile.dart';
import 'login.dart';
import 'subsidy_simulation1.dart';
import 'subsidy_simulation2.dart' as sim2;
import 'subsidy_simulation4.dart';
import 'subsidy_simulation5.dart';
import 'upi_tutorial.dart';
import 'upi_selection.dart';
import 'home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://yjimdxjdehalrgdsyifx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlqaW1keGpkZWhhbHJnZHN5aWZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkzODIzNTIsImV4cCI6MjA1NDk1ODM1Mn0.CMQ4hYbOLxHl27WgU891Ls_hOmWY-vggQ57vOYt1eB8',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.blue),
          ),
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/': (context) => LoginPage(),
          '/home': (context) => HomeScreen(),
          '/profile': (context) => ProfilePage(),
          '/subsidy': (context) => SubsidySimulation(),
          '/subsidy4': (context) => SubsidySimulation4(),
          '/subsidy5': (context) => SubsidySimulation5(),
          '/subsidy2': (context) => const sim2.SubsidySimulation2(),
          '/email_simulation': (context) => EmailSimulation(),
          '/upi_tutorial': (context) => const UPITutorialScreen(),
          '/upi': (context) => const UPISelectionScreen(),
          '/categories': (context) => CategoriesPage(),
          'chatbot': (context) => const ChatbotPage(),
          '/auth': (context) => LoginPage1(),
          '/register': (context) => RegistrationPage(),
        },
      ),
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
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  // SizedBox(width: 20),
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
                            Icon(Icons.search, color: Colors.blue.shade800),
                            SizedBox(width: 10),
                            Text(
                              'Search...',
                              style: TextStyle(color: Colors.blue.shade800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        actions: _isSearching
            ? [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.blue.shade800),
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
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...[
              {'icon': Icons.leaderboard, 'text': 'Leaderboard', 'route': ''},
              {'icon': Icons.school, 'text': 'Courses', 'route': '/home'},
              {
                'icon': Icons.category,
                'text': 'Categories',
                'route': '/categories'
              },
              {'icon': Icons.person, 'text': 'Profile', 'route': '/profile'},
              {'icon': Icons.info, 'text': 'About us', 'route': '/categories'},
              {'icon': Icons.help, 'text': 'Help', 'route': '/profile'},
              {
                'icon': Icons.monetization_on,
                'text': 'Subsidy Simulation',
                'route': '/subsidy'
              },
              {
                'icon': Icons.email,
                'text': 'Email Simulation',
                'route': '/email_simulation'
              },
              {
                'icon': Icons.payment,
                'text': 'UPI Simulation',
                'route': '/upi_tutorial'
              },
            ].map((item) => ListTile(
                  leading: Icon(item['icon'] as IconData),
                  title: Text(item['text'] as String),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, item['route'] as String),
                )),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
