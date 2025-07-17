import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/firebase_operations/firebase_services.dart';
import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/shared/ui_components.dart';

class RegisteredUserPage extends StatefulWidget {
  const RegisteredUserPage({super.key});

  @override
  State<RegisteredUserPage> createState() => _RegisteredUserPageState();
}

class _RegisteredUserPageState extends State<RegisteredUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered User", style: mTextStyle15()),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreServicesOperations().allUsersFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Text('No users found');
          } else {
            final docs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final user = docs[index].data() as Map<String, dynamic>;
                return InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    context.pushReplacement(AppRoutes.CHAT, extra:{"mobile": user['mobile']});
                  }, // for ripple to match shap
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/splash_cht.png'),
                        radius: 24,

                      ),
                      title: Text(user['mobile'] ?? 'Unknown'),
                      subtitle: Text('Last Seen: ${user['lastSeen']}'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
