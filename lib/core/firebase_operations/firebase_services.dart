import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServicesOperations {
  static const COLLECTION = "users"; // database name
  static const COLLECTION_CHAT = "chats"; // database name

  final CollectionReference? usersRef = FirebaseFirestore.instance
      .collection(COLLECTION);

  final CollectionReference? chatRef = FirebaseFirestore.instance
      .collection(COLLECTION_CHAT);

  Future<bool> saveUserIfNotExists(
      {
        required String mobileNumber,
        String? name,
        String? profilePicUrl,
      }) async {
    try {
      final docRef = usersRef?.doc(mobileNumber);
      final docSnapshot = await docRef?.get();

      if (docSnapshot?.exists == true) {
        return true;
      }


      await usersRef?.doc(mobileNumber).set({
        'mobile': mobileNumber,
        'name': name ?? '$mobileNumber',
        'profilePic': profilePicUrl ??
            'https://testingbot.com/free-online-tools/random-avatar/90',
        'lastSeen': FieldValue.serverTimestamp(),
      }, SetOptions(
          merge: true),); // merge true ensures updating existing data if needed
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false; // failure
    }
  }


  Stream<QuerySnapshot>? allUsersFromDatabase()  {
    try {
      return usersRef!.orderBy("lastSeen", descending: false).snapshots();
    } catch (e) {
      print('Error fetching Users : $e');
      return null; // failure
    }
  }

//{
//   "sender": "9876543210",
//   "receiver": "9876543211",
//   "message": "Hello, how are you?",
//   "timestamp": "2025-07-16T09:30:00.000Z"
// }

   String getChatId(String sender, String receiver) {
    return sender.compareTo(receiver) < 0 ? '$sender\_$receiver' : '$receiver\_$sender';
  }


  Future<bool> sendMessage({ required String sender, required String receiver, required String msg }) async {
    try {
      final chatId = getChatId(sender, receiver);

      await chatRef?.doc(chatId).collection("messages").add({
        'sender': sender,
        'receiver': receiver,
        'message': msg,
        'timestamp': Timestamp.now(),
      });

      await chatRef?.doc(chatId).set({
        'participants': [sender, receiver],
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // merge avoids overwrite

      return true;
    } catch (e) {
      print('Error sending message: $e');
      return false; // failure
    }
  }


  Stream<QuerySnapshot>? getMyChats(String myMobile) {
    try {
      return chatRef!.where('participants', arrayContains: myMobile)
          .snapshots();
    } catch (e) {
      print('Error fetching Chats : $e');
      return null; // failure
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? fetchChatMessages(String chatId) {
   try {
      return chatRef!.doc(chatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots();
    } catch (e) {
      print('Error fetching Messages : $e');
      return null; // failure
    }
  }



//
// // reading data within the 'notes' collection
// // we have made earlier in the form of snapshots
//
// Stream<QuerySnapshot> showNotes() {
//   final notesStream =
//   notes!.orderBy('timestamp', descending: true).snapshots();
//
//   return notesStream;
// }
//
// // update the data by accessing the particular
// // docId of the note which we want to update.
//
// Future<void> updateNotes(String docId, String newNote, Timestamp time) {
//   return notes!.doc(docId).update({'note': newNote, 'timestamp': time});
// }
//
// // delete the data by accessing the particular
// // which we want to delete.
//
// Future<void> deleteNote(String docId) {
//   return notes!.doc(docId).delete();
// }
}
