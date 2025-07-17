import 'package:flutter/material.dart';


TextStyle mTextStyle35() {
  return TextStyle(
    fontSize: 35,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
TextStyle mTextStyleFrom12() {
  return TextStyle(fontSize: 12,color: Colors.deepPurple, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic);
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



