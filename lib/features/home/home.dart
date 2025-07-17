import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    // TODO: implement initState
    super.initState();
    mobielNo = prefInstance(context).getString(MOBILENO) ?? "";
    print("Mobile ==> $mobielNo");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(SPL, style: mTextStyle20()),
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
            context.push(AppRoutes.LIST);

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
  ChatTab({super.key});

  // Sample user list
  final List<Map<String, String>> users = [
    // {
    //   'name': 'mani',
    //   'message': 'hello',
    //   'time': '10:30 AM',
    //   'image': 'assets/user1.png'
    // }


  ];

  @override
  Widget build(BuildContext context) {
    return users.isEmpty
        ? Center(
            child: Text(
              "No chat started Yet!",
              style: mTextStyle20().copyWith(color: Colors.black87),
            ),
          )
        : ListView.builder(
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
