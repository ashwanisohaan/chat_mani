import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/firebase_operations/firebase_services.dart';
import 'package:whatsapp_design/core/provider/preferences/provider_shared_pref.dart';
import 'package:whatsapp_design/core/shared//app_constants.dart';
import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/shared/ui_components.dart';

import '../../core/provider/preferences/preference_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String mobielNo;

  @override
  void initState() {
    super.initState();
    mobielNo = prefInstance(context).getString(MOBILENO) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // Prevent default back behavior
      onPopInvoked: (didPop) async {
        if (!didPop) {
          // Ask user before exiting
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Exit App"),
              content: const Text("Do you really want to exit the app?"),
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
            Navigator.of(context).pop(); //Go back
          }
        }
      },

      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(SPL, style: mTextStyle20()),
            backgroundColor: Colors.deepPurple,
          ),
          body: TabBarView(
            children: [
              ChatTab(mobileNo: mobielNo),
              //Center(child: Text('Chat List')),
            //  Center(child: Text('Status Updates')),
           //   Center(child: Text('Call Logs')),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              context.push(AppRoutes.LIST);

              // Add new chat or status
            },
            child: const Icon(Icons.chat, color: Colors.white),
            //child: const Icon(Icons.chat,color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
//import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  final mobileNo;
  ChatTab({super.key, required this.mobileNo});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreServicesOperations().getMyChats(mobileNo),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final chats = snapshot.data?.docs ?? [];

          if (chats.isEmpty) return Text("No chats yet");

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chatDoc = chats[index];
              final chatId = chatDoc.id;

              // You can parse participant to find the other person
              final participants = List<String>.from(chatDoc['participants']);
              final otherUser = participants.firstWhere((p) => p != mobileNo);

              return ListTile(
                title: Text("Chatting to $otherUser"),
                subtitle: Text("Tap to open chat"),
                onTap: () {
                  context.push(
                    AppRoutes.CHAT,
                    extra: {"chatId": chatId, "mobile": otherUser},
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
