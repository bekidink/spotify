import 'package:flutter/material.dart';

Widget signInText( String title,String description,VoidCallback onPressed){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description,style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14
        ),),
        TextButton(onPressed: onPressed, child: Text(title))
      ],
    ),
  );
}