import 'package:digisetu/main.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'home_page.dart'; // Import HomePage

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late GenerativeModel _model;

  @override
  void initState() {
    super.initState();
    // Initialize the Gemini model with the API key
    _model = GenerativeModel(
        model: 'gemini-pro', apiKey: 'AIzaSyDaFZCfF651AJCUH39Nb2tE4VQNViezPhk');

    // Add a welcome message from the bot
    _messages.add({
      'role': 'bot',
      'message': 'Hello! How can I assist you with digital literacy today?',
    });
  }

  void _sendMessage() async {
    String text = _controller.text;
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

    setState(() {
      _messages.add({'role': 'bot', 'message': response.text ?? 'No response'});
    });
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
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
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
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
