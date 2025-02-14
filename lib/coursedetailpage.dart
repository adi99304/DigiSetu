import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseName;

  const CourseDetailPage({Key? key, required this.courseName})
      : super(key: key);

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  final FlutterTts flutterTts = FlutterTts();
  final GoogleTranslator translator = GoogleTranslator();

  String? videoUrl;
  String? courseInfo;
  String? translatedCourseInfo;
  bool isLoading = true;
  bool hasError = false;
  YoutubePlayerController? _controller;
  bool _isFullScreen = false;
  bool _isSpeaking = false;
  String selectedLanguage = "en"; // Default language

  @override
  void initState() {
    super.initState();
    fetchCourseData();
    _initTts();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });
  }

  Future<void> _speak() async {
    if (_isSpeaking) {
      await flutterTts.stop();
      setState(() {
        _isSpeaking = false;
      });
    } else {
      setState(() {
        _isSpeaking = true;
      });
      await flutterTts.setLanguage(_getTtsLanguage(selectedLanguage));
      await flutterTts.speak(
          translatedCourseInfo ?? courseInfo ?? 'No instructions available');
    }
  }

  Future<void> fetchCourseData() async {
    try {
      final response = await supabase
          .from('courses')
          .select('video_url, course_info')
          .eq('course_name', widget.courseName)
          .maybeSingle();

      if (response != null) {
        String? url = response['video_url'];
        String? info = response['course_info'];

        if (url != null) {
          String? videoId = YoutubePlayer.convertUrlToId(url);
          if (videoId != null) {
            setState(() {
              videoUrl = url;
              courseInfo = info;
              _controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                  enableCaption: true,
                  hideControls: false,
                ),
              )..addListener(_onYoutubePlayerStateChanged);
            });
          }
        }
      }
    } catch (e) {
      print("Error fetching course data: \$e");
      setState(() {
        hasError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _translateCourseInfo() async {
    if (courseInfo != null) {
      var translation =
          await translator.translate(courseInfo!, to: selectedLanguage);
      setState(() {
        translatedCourseInfo = translation.text;
      });
    }
  }

  String _getTtsLanguage(String langCode) {
    switch (langCode) {
      case 'hi':
        return 'hi-IN';
      case 'mr':
        return 'mr-IN';
      default:
        return 'en-US';
    }
  }

  void _onYoutubePlayerStateChanged() {
    if (_controller?.value.isFullScreen != _isFullScreen) {
      setState(() {
        _isFullScreen = _controller?.value.isFullScreen ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isFullScreen) {
          _controller?.toggleFullScreenMode();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: _isFullScreen
            ? null
            : AppBar(
                title: Text(
                  widget.courseName,
                  style: const TextStyle(color: Colors.white),
                ),
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hasError
                ? const Center(child: Text("Error loading course content"))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        YoutubePlayer(
                          controller: _controller!,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.yellow[100],
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedLanguage,
                                        dropdownColor: Colors.yellow[100],
                                        style: TextStyle(color: Colors.black),
                                        items: const [
                                          DropdownMenuItem(
                                              value: "en",
                                              child: Text("English")),
                                          DropdownMenuItem(
                                              value: "hi",
                                              child: Text("Hindi")),
                                          DropdownMenuItem(
                                              value: "mr",
                                              child: Text("Marathi")),
                                        ],
                                        onChanged: (String? newLang) {
                                          setState(() {
                                            selectedLanguage = newLang!;
                                          });
                                          _translateCourseInfo();
                                        },
                                        icon: Icon(Icons.language,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _speak,
                                    icon: Icon(
                                      _isSpeaking
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(translatedCourseInfo ??
                                  courseInfo ??
                                  "No instructions available"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    _controller?.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
