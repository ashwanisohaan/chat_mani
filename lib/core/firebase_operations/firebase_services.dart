import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static const COLLECTION = "users"; // database name

  final CollectionReference? usersRef = FirebaseFirestore.instance
      .collection(COLLECTION,);

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


//
// Future<void> addNote(String note, String noteBy) {
//   return notes!.add(
//     {'author': noteBy, 'note': note, 'timestamp': Timestamp.now()},
//   );
// }
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
