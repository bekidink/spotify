import 'package:flutter/material.dart';

Widget emailField(BuildContext context,String hintText,TextEditingController controller){

  return TextField(
    controller: controller,
   decoration: InputDecoration(
    hintText: hintText
   ).applyDefaults(
    Theme.of(context).inputDecorationTheme,
    
   ),
  );
}