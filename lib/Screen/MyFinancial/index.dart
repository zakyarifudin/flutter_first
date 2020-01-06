import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageSlider/index.dart';
import 'cardDetail.dart';
import 'backgroundHeader.dart';
import 'summaryCash.dart';

class MyFinancial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  backgroundHeader(), 
                  summaryCash(),
                  // Positioned(
                  //   top: 230.0,
                  //   left: 25,
                  //   child: Container(
                  //     width: 360,
                  //     height: 120,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(30),               
                  //     ),
                  //   ),
                  // )
                ],
              ),
                
              cardDetail('Makan Siang', 'Beli Makan Di Warteg', '10.000', 'out'),
              cardDetail('Bonus', 'Dapat Bonus Proyek', '500.000', 'in'),
              cardDetail('Beli Baju', 'Baju Kemeja Kantor', '250.000', 'out'),
              ImageSlider()
            ],
          ),
        ),
      ),
    );
  }
}