import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/features/home/home.dart';
import 'package:whatsapp_design/shared/ui_components.dart';

import 'chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      PopScope(
        canPop: true, // Prevent default back behavior
        onPopInvoked: (didPop) async {
          if (!didPop) {
            // Ask user before exiting
            final shouldExit = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Exit Chat"),
                content: const Text("Do you really want to exit the chat?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("Exit"),
                  ),
                ],
              ),
            );

            if (shouldExit == true) {
              Navigator.of(context).pop();  //Go back

            }
          }
        },
         child: Scaffold(
          appBar: AppBar(
            backgroundColor:  Colors.deepPurple,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user1.png'),
                  radius: 18,
                ),
                 SizedBox(width: 10),
                 Text('mani',style: mTextStyle20(),),

              ],
            ),
          ),
          body: Column(
            children: [
              // Message List
              Expanded(
                child: chtConstraints()
              ),

              // Message Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: const Icon(Icons.send, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
               ),
       );

  }
}




/*import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  // List of messages with text and who sent it
  List<Map<String, dynamic>> messages = [
    {'text': 'Hello!', 'isMe': false},
    {'text': 'Hi, how are you?', 'isMe': true},
  ];

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'isMe': true}); // 👈 isMe is true
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,  Result) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        //final bool? shouldPop = await _showBackDialog();
        if (didPop ?? false) {
          navigator.pop('/home');
        }
      },
      
      child: Scaffold(
        appBar: AppBar(title: const Text("Chat")),
        body: Column(
          children: [
            // Messages list
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return Align(
                    alignment: msg['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                    child: ChatBubble(
                      message: msg['text'],
                      isMe: msg['isMe'],
                    ),
                  );
                },
              ),
            ),

            // Input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}*/


