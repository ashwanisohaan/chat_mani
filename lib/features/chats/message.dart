


import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {

  String sender;
  String receiver;
  String msg;
  Timestamp timeStamp = Timestamp.now();

  ChatMessage({required this.sender, required this.receiver, required this.msg, required this.timeStamp});
}