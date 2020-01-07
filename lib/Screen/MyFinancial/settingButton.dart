import 'package:flutter/material.dart';

Widget settingButton(){
  return Positioned( 
    top: 50,
    right: 30,
    child: GestureDetector(
      onTap: () {
        print("Setting Button Yuhu!");
      },
      child: Icon(
        Icons.settings,
        color: Colors.white,
        size: 30,
      )
    ),
  );
}