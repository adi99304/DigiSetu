import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late GenerativeModel _model;

  // Speech-to-text variables
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';

  // Text-to-speech variables
  late FlutterTts _flutterTts;
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    // Initialize the Gemini model with the API key
    _model = GenerativeModel(model: 'gemini-pro', apiKey: 'AIzaSyDaFZCfF651AJCUH39Nb2tE4VQNViezPhk');

    // Initialize speech-to-text
    _speech = stt.SpeechToText();
    _initSpeech();

    // Initialize text-to-speech
    _flutterTts = FlutterTts();
    _initTts();

    // Add a welcome message from the bot
    _messages.add({
      'role': 'bot',
      'message': 'Hello! How can I assist you with digital literacy today?',
    });
  }

  // Initialize speech-to-text
  void _initSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {});
    } else {
      print('Speech recognition not available');
    }
  }

  // Initialize text-to-speech
  void _initTts() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.5); // Adjust speech rate
    await _flutterTts.setVolume(1.0); // Adjust volume
    await _flutterTts.setPitch(1.0); // Adjust pitch
  }

  // Start listening for voice input
  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (result) {
            setState(() {
              _spokenText = result.recognizedWords;
            });
          },
        );
      }
    }
  }

  // Stop listening for voice input
  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
        _controller.text = _spokenText; // Set the spoken text to the input field
      });
    }
  }

  // Speak the bot's response
  void _speak(String text) async {
    if (!_isSpeaking) {
      setState(() {
        _isSpeaking = true;
      });
      await _flutterTts.speak(text);
      _flutterTts.setCompletionHandler(() {
        setState(() {
          _isSpeaking = false;
        });
      });
    }
  }

  // Stop speaking
  void _stopSpeaking() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      setState(() {
        _isSpeaking = false;
      });
    }
  }

  void _sendMessage() async {
    String text = _controller.text;
    if (text.isEmpty) return; // Don't send empty messages

    _controller.clear();
    setState(() {
      _messages.add({'role': 'user', 'message': text});
    });

    // Prepare the system instruction for the chatbot
    final systemInstruction = '''
    You are a helpful, patient, and friendly digital assistant designed to assist users who are new to mobile devices, email, UPI, and digital tools. Your goal is to provide clear, step-by-step guidance in simple language with easy-to-follow instructions.
    ''';

    // Send the user's message along with the system instruction
    final response = await _model.generateContent([
      Content.text(systemInstruction),
      Content.text(text),
    ]);

    final botResponse = response.text ?? 'No response';

    setState(() {
      _messages.add({'role': 'bot', 'message': botResponse});
    });

    // Speak the bot's response
    _speak(botResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Digital Assistant',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.5),
        actions: [
          // Stop speaking button
          IconButton(
            icon: Icon(
              _isSpeaking ? Icons.volume_off : Icons.volume_up,
              color: _isSpeaking ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (_isSpeaking) {
                _stopSpeaking();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[50] : Colors.green[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isUser ? 12 : 0),
                        topRight: Radius.circular(isUser ? 0 : 12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: isUser ? Colors.blue[900] : Colors.green[900],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Voice input button
                IconButton(
                  icon: Icon(
                    _isListening ? Icons.mic_off : Icons.mic,
                    color: _isListening ? Colors.red : Colors.blue,
                  ),
                  onPressed: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                ),
                SizedBox(width: 8),
                // Text input field
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Send button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}