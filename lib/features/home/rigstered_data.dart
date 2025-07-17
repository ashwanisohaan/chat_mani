import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_design/shared/ui_components.dart';

class RegisteredUserPage extends StatefulWidget {
  const RegisteredUserPage({super.key});

  @override
  State<RegisteredUserPage> createState() => _RegisteredUserPageState();
}

class _RegisteredUserPageState extends State<RegisteredUserPage> {
  List<String> users = [];

  @override
  void initState() {
    super.initState();
    loadRegisteredUser();
  }

  Future<void> loadRegisteredUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mob = prefs.getString('mobile_number');
    if (mob != null) {
      setState(() {
        users = [mob]; // Later you can add multiple users here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Registered User",style: mTextStyle20(),),
        backgroundColor: Colors.deepPurple,
      ),
      body: users.isEmpty
          ? const Center(child: Text("No user registered"))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text("User ${index + 1}"),
              subtitle: Text(users[index]),
            ),
          );
        },
      ),
    );
  }
}
