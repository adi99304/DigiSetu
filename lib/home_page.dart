import 'package:digisetu/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            // Header with Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore Courses",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  Icon(Icons.school, color: Colors.blue.shade800, size: 30),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Featured Courses Carousel
            // Featured Courses Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
              ),
              items: List.generate(5, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Course Image
                      Image.asset(
                        'assets/poo (2).png', // Replace with actual image paths
                        fit: BoxFit.cover,
                      ),
                      // Gradient Overlay for Better Readability
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      // Course Title
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Featured Course ${index + 1}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            // Top Picks Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Top Picks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            // Horizontal Card Slider for Top Picks
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple.shade300,
                              Colors.purple.shade800
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Pick ${index + 1}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Popular Courses Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            // Course Cards with Neumorphic Design
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.book, size: 40, color: Colors.blue),
                          SizedBox(width: 15),
                          Text(
                            "Course ${index + 1}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotPage()),
          );
        },
        child: Icon(Icons.chat, color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
