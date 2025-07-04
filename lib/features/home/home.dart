import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/constant/app_constants.dart';
import 'package:whatsapp_design/shared/ui_components.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(SPL,style: mTextStyle20(),),
          backgroundColor: Colors.deepPurple,
          bottom:  TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatTab(),
            //Center(child: Text('Chat List')),
            Center(child: Text('Status Updates')),
            Center(child: Text('Call Logs')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            // Add new chat or status
          },
          child: const Icon(Icons.chat, color: Colors.white),
          //child: const Icon(Icons.chat,color: Colors.white,),
        ),
      ),
    );
  }
}
//import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  // Sample user list
  final List<Map<String, String>> users = [
    {
      'name': 'mani',
      'message': 'hello',
      'time': '10:30 AM',
      'image': 'assets/user1.png'
    },
    {
      'name': 'sukh paji',
      'message': 'flutter example',
      'time': '9:15 AM',
      'image': 'assets/user2.png'
    },
    {
      'name': 'Prikshit',
      'message': 'hii',
      'time': 'Yesterday',
      'image': 'assets/user3.png'
    },
  ];

   ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(user['image']!),
            radius: 25,
          ),
          title: Text(
            user['name']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(user['message']!),
          trailing: Text(
            user['time']!,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          onTap: () {
            context.go('/chat');
            // Navigate to chat screen
          },
        );
      },
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for time formatting

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> users = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void addUser() {
    final name = nameController.text;
    final message = messageController.text;
    final image = imageController.text;
    final time = DateFormat('hh:mm a').format(DateTime.now()); // current time

    if (name.isNotEmpty && message.isNotEmpty && image.isNotEmpty) {
      setState(() {
        users.add({
          'name': name,
          'message': message,
          'time': time,
          'image': image,
        });
        nameController.clear();
        messageController.clear();
        imageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Chat User'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(labelText: 'Message'),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image Path (e.g. assets/user1.png)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addUser,
              child: const Text('Add Chat'),
            ),
            const Divider(height: 20),
            const Text('User Chat List', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user['image']!),
                      radius: 25,
                    ),
                    title: Text(user['name']!),
                    subtitle: Text(user['message']!),
                    trailing: Text(user['time']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
