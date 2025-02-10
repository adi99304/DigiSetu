// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   bool _isSearching = false;
//   TextEditingController _searchController = TextEditingController();
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/categories');
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, '/profile');
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _isSearching
//             ? TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//           ),
//           autofocus: true,
//         )
//             : Row(
//           children: [
//             Text(
//               "DigiSetu",
//               style: TextStyle(
//                   color: Colors.blue, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(width: 20),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isSearching = true;
//                   });
//                 },
//                 child: Container(
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(width: 10),
//                       Icon(Icons.search, color: Colors.blue),
//                       SizedBox(width: 10),
//                       Text(
//                         'Search...',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         actions: _isSearching
//             ? [
//           IconButton(
//             icon: Icon(Icons.close, color: Colors.blue),
//             onPressed: () {
//               setState(() {
//                 _isSearching = false;
//                 _searchController.clear();
//               });
//             },
//           ),
//         ]
//             : null,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.leaderboard),
//               title: Text('Leaderboard'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.school),
//               title: Text('Courses'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/home');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.category),
//               title: Text('Categories'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/categories');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Profile'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/profile');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text('About us'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.help),
//               title: Text('Help'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.monetization_on),
//               title: Text('Subsidy Simulation'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/subsidy');
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   height: 30,
//                   child: Text(
//                     "Popular courses",
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 200,
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                 ),
//                 items: List.generate(5, (index) {
//                   return Container(
//                     margin: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Slide ${index + 1}",
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Categories",
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: Container(
//                             width: 150,
//                             child: Center(child: Text("Category ${index + 1}")),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.chat),
//               backgroundColor: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Courses',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
