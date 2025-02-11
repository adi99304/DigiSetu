import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';

class EmailSimulation extends StatefulWidget {
  @override
  _EmailSimulationState createState() => _EmailSimulationState();
}

class _EmailSimulationState extends State<EmailSimulation> {
  List<Map<String, dynamic>> emails = [
    {
      "sender": "support@digisetu.com",
      "subject": "Welcome to DigiSetu!",
      "body": "Learn digital skills with us.",
      "category": "Primary",
      "avatar": "S",
      "read": false,
      "starred": false
    },
    {
      "sender": "bank@finance.com",
      "subject": "Your Account Statement",
      "body": "Your balance is updated.",
      "category": "Primary",
      "avatar": "B",
      "read": false,
      "starred": false
    },
    {
      "sender": "facebook@social.com",
      "subject": "Friend Request",
      "body": "You have a new friend request!",
      "category": "Social",
      "avatar": "F",
      "read": false,
      "starred": false
    },
    {
      "sender": "shop@store.com",
      "subject": "Big Sale on Electronics",
      "body": "Get up to 50% off!",
      "category": "Promotions",
      "avatar": "S",
      "read": false,
      "starred": false
    },
  ];

  List<Map<String, dynamic>> sentEmails = [];
  List<Map<String, dynamic>> drafts = [];
  List<Map<String, dynamic>> trash = [];
  String? attachmentPath;
  String searchQuery = "";
  String selectedFolder = "Inbox";

  @override
  void initState() {
    super.initState();
    _loadEmails();
  }

  Future<void> _loadEmails() async {
    final prefs = await SharedPreferences.getInstance();
    final sentData = prefs.getString('sentEmails');
    final draftData = prefs.getString('drafts');
    final trashData = prefs.getString('trash');

    if (sentData != null) {
      setState(() {
        sentEmails = List<Map<String, dynamic>>.from(json.decode(sentData));
      });
    }
    if (draftData != null) {
      setState(() {
        drafts = List<Map<String, dynamic>>.from(json.decode(draftData));
      });
    }
    if (trashData != null) {
      setState(() {
        trash = List<Map<String, dynamic>>.from(json.decode(trashData));
      });
    }
  }

  Future<void> _saveEmails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('sentEmails', json.encode(sentEmails));
    prefs.setString('drafts', json.encode(drafts));
    prefs.setString('trash', json.encode(trash));
  }

  void _sendEmail(String recipient, String subject, String body) {
    setState(() {
      sentEmails.add({
        "sender": "You",
        "recipient": recipient,
        "subject": subject,
        "body": body,
        "attachment": attachmentPath ?? "No attachment",
        "read": true,  // Ensure this is not null
        "starred": false, // Ensure this is not null
        "avatar": "Y"
      });
      selectedFolder = "Sent"; // Switch to Sent after sending
    });
    _saveEmails();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Email sent successfully!")),
    );
    Navigator.pop(context);
  }

  void _moveToTrash(int index, List<Map<String, dynamic>> list) {
    setState(() {
      trash.add(list[index]);
      list.removeAt(index);
    });
    _saveEmails();
  }

  void _toggleStar(int index) {
    setState(() {
      emails[index]["starred"] = !(emails[index]["starred"] as bool);
    });
  }

  void _restoreFromTrash(int index) {
    setState(() {
      emails.add(trash[index]);
      trash.removeAt(index);
    });
    _saveEmails();
  }

  void _composeEmail() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController recipientController = TextEditingController();
        TextEditingController subjectController = TextEditingController();
        TextEditingController bodyController = TextEditingController();

        return AlertDialog(
          title: Text("Compose Email"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: recipientController, decoration: InputDecoration(labelText: "Recipient")),
              TextField(controller: subjectController, decoration: InputDecoration(labelText: "Subject")),
              TextField(controller: bodyController, decoration: InputDecoration(labelText: "Body"), maxLines: 3),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _sendEmail(recipientController.text, subjectController.text, bodyController.text);
              },
              child: Text("Send"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmailList(List<Map<String, dynamic>> list) {
    if (searchQuery.isNotEmpty) {
      list = list.where((email) {
        return email["subject"].toLowerCase().contains(searchQuery.toLowerCase()) ||
            email["sender"].toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return list.isEmpty
        ? Center(child: Text("No emails here"))
        : ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(list[index]["subject"]),
          background: Container(color: Colors.red, child: Icon(Icons.delete, color: Colors.white)),
          secondaryBackground:
          Container(color: Colors.blue, child: Icon(Icons.archive, color: Colors.white)),
          onDismissed: (direction) {
            _moveToTrash(index, list);
          },
          child: ListTile(
            leading: CircleAvatar(child: Text(list[index]["avatar"])),
            title: Text(
              list[index]["subject"],
              style: TextStyle(fontWeight: list[index]["read"] ? FontWeight.normal : FontWeight.bold),
            ),
            subtitle: Text(list[index]["sender"]),
            trailing: IconButton(
              icon: Icon(list[index]["starred"] ? Icons.star : Icons.star_border),
              onPressed: () => _toggleStar(index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Gmail Simulation", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          _drawerItem(Icons.inbox, "Inbox"),
          _drawerItem(Icons.star, "Starred"),
          _drawerItem(Icons.send, "Sent"),
          _drawerItem(Icons.drafts, "Drafts"),
          _drawerItem(Icons.delete, "Trash"),
          Divider(),
          _drawerItem(Icons.label, "Primary"),
          _drawerItem(Icons.people, "Social"),
          _drawerItem(Icons.local_offer, "Promotions"),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selectedFolder == title,
      onTap: () {
        setState(() {
          selectedFolder = title;
          Navigator.pop(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> selectedEmails =
    selectedFolder == "Inbox" ? emails : selectedFolder == "Sent" ? sentEmails : selectedFolder == "Trash" ? trash : [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Email Simulation"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: _buildDrawer(),
      body: _buildEmailList(selectedEmails),
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        child: Icon(Icons.add),
      ),
    );
  }
}
