import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/firebase_operations/firebase_services.dart';
import 'package:whatsapp_design/shared/ui_components.dart';
import 'package:whatsapp_design/shared/utility.dart';

import '../../core/provider/preferences/preference_constants.dart';
import '../../core/provider/preferences/provider_shared_pref.dart';
import 'chat_bubble.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String mobileNoToChat = "";
  final TextEditingController txtController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginMobile = prefInstance(context).getString(MOBILENO) ?? "";
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final String mobileNoToChat = extra?['mobile'] ?? '';

    final String chatId = extra?['chatId'] ?? FirestoreServicesOperations().getChatId(loginMobile, mobileNoToChat);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/splash_cht.png'),
              radius: 18,
            ),
            SizedBox(width: 10),
            Text('Chatting with ${mobileNoToChat}', style: mTextStyle15()),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirestoreServicesOperations().fetchChatMessages(chatId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No messages yet"));
                } else {
                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true, // show latest message at bottom
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index].data();
                      final msg = message['message'];
                      final sender = message['sender'];
                      final from = message['receiver'];
                    //  final Timestamp timeStamp = (message['timestamp'] as Timestamp);

                      return loginMobile == sender
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: ChatBubble(message: msg, timeStamp: "${from}", isMe: true),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: ChatBubble(message: msg, timeStamp:  "$from", isMe: false),
                            );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a message...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: txtController,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 22,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                  onTap: () async {

                    if(txtController.text.trim().isEmpty){
                      return;
                    }

                    final success = await FirestoreServicesOperations()
                        .sendMessage(
                          sender: loginMobile,
                          receiver: mobileNoToChat,
                          msg: txtController.text.trim(),
                        );

                    if (success) {
                      txtController.clear();
                    } else {
                      "Failed to send".showAppSnackBar(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
