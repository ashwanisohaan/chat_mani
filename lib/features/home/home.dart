import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/shared//app_constants.dart';
import 'package:whatsapp_design/shared/ui_components.dart';
class HomePage extends StatefulWidget {

   String? mobile;

   HomePage({super.key, required this.mobile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String mobielNo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobielNo = widget.mobile ?? "+91";
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(SPL,style: mTextStyle20(),),
          backgroundColor: Colors.deepPurple,
         /* bottom:  TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),*/
        ),
        body:
        TabBarView(
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



/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    await _firestore.collection('messages').add({
      'text': _messageController.text,
      'timestamp': FieldValue.serverTimestamp(),
      'sender': 'User1', // Replace with Firebase Auth later if needed
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return ListTile(
                      title: Text(msg['text']),
                      subtitle: Text(msg['sender']),
                    );
                  },
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/