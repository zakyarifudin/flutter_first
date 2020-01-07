import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageSlider/index.dart';
import 'cardDetail.dart';
import 'backgroundHeader.dart';
import 'summaryCash.dart';

class MyFinancial extends StatefulWidget {
  @override
  _MyFinancial createState() => _MyFinancial();
}

class _MyFinancial extends State<MyFinancial> with TickerProviderStateMixin{

  AnimationController _controllerScale, _controllerSlide;
  Animation<double> _animationScale; 
  Animation<Offset> _animationSlide;

  void initState(){
    super.initState();
    // Scale 
    _controllerScale = AnimationController(
      duration: const Duration(milliseconds: 2000), 
      vsync: this, 
      value: 0.2
    );
    _animationScale = CurvedAnimation(parent: _controllerScale, curve: Curves.easeInOut);
   

    // Slide
    _controllerSlide = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    //..repeat(reverse: true);
    _animationSlide = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllerSlide,
      curve: Curves.ease,
    ));

    _controllerSlide.forward();
    _controllerScale.forward();
  }

  void dispose(){
    super.dispose();
    _controllerScale.dispose();
    _controllerSlide.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              SlideTransition(
                position: _animationSlide,
                child: Stack(
                  children: <Widget>[
                    backgroundHeader(), 
                    summaryCash(),
                  ],
                ),
              ),            
              ScaleTransition(
                scale: _animationScale,
                child: cardDetail('Makan Siang', 'Makan di Burjo', '9.000', 'out'), 
              ),
              ScaleTransition(
                scale: _animationScale,
                child: cardDetail('Gajian', 'Dapat Gaji', '2.500.000', 'in'),
              ),
              ScaleTransition(
                scale: _animationScale,
                child: cardDetail('Beli Baju', 'Baju Biasa', '250.000', 'out'),
              ),
              ImageSlider()
            ],
          ),
        ),
      ),
    );
  }
}