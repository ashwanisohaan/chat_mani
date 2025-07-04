import 'package:flutter/material.dart';

import '../features/home/chat_bubble.dart';

TextStyle mTextStyle35() {
  return TextStyle(
    fontSize: 35,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
TextStyle mTextStyle15() {
  return TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold);
}
TextStyle mTextStyle20() {
  return TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold);
}

Widget commonElevatedButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.red,
  Color textColor = Colors.white,
  double borderRadius = 12.0,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 24,
  ),
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
    ),
    child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
  );
}
Widget chtConstraints({
 // required String txt,
Color color = Colors.deepPurple,
Color textColor = Colors.white,

}){
  return ListView(
    padding:  EdgeInsets.all(10),
    children:  [
      Align(
        alignment: Alignment.centerLeft,
        child: ChatBubble(
          message: 'Hi there!',
          isMe: false,
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ChatBubble(
          message: 'Hello! How are you?',
          isMe: true,
        ),
      ),
    ],
  );
}




