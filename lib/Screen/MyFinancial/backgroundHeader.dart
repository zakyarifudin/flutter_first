import 'package:flutter/material.dart';

Widget backgroundHeader() {
  return Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 60, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Zaky Arifudin",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "zakyarifudin9@gmail.com",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}