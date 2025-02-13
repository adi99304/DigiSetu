import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TutorialPage extends StatefulWidget {
  final String categoryName;
  final List<String> predefinedCourses; // Added predefined course list

  TutorialPage({required this.categoryName, required this.predefinedCourses});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<String> courses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      final response = await supabase
          .from('courses')
          .select('course_name')
          .eq('category', widget.categoryName);

      setState(() {
        courses = response.isNotEmpty
            ? response.map<String>((c) => c['course_name'] as String).toList()
            : widget.predefinedCourses; // Fallback to predefined courses
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching courses: $e");
      setState(() {
        courses = widget.predefinedCourses; // Fallback in case of an error
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(0.1),
              elevation: 0,
              title: Text(
                '${widget.categoryName} Courses',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // **Gradient Background**
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // **Loading or Course List**
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : courses.isEmpty
                    ? Center(
                        child: Text(
                          "No courses available",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white.withOpacity(0.15),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16),
                              leading: Icon(Icons.play_circle_fill,
                                  color: Colors.white, size: 32),
                              title: Text(
                                courses[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                "Tap to explore",
                                style: TextStyle(color: Colors.white70),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                              onTap: () {
                                // Handle course tap
                              },
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
