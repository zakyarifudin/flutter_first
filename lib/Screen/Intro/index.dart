import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "ERASER",
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/eraser.png",
        // backgroundColor: Color(0xfff5a623),
        colorBegin: Colors.yellow,
        colorEnd: Colors.green,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/pencil.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "BOMBILLA",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/bombilla.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: (){
        Navigator.pop(context);
      },
      nameSkipBtn: "LEWATI",
      // nameDoneBtn: "SELESAI",
      // nameNextBtn: "LANJUT",
      // namePrevBtn: "KEMBALI",
      renderNextBtn: Icon(Icons.navigate_next, color: Colors.white, size: 30),
      renderPrevBtn: Icon(Icons.navigate_before, color: Colors.white, size: 30),
      renderDoneBtn: Icon(Icons.done, color: Colors.white, size: 30),
      colorDot: Colors.white70,
      colorActiveDot: Colors.white,
      highlightColorDoneBtn: Colors.green,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      isScrollable: true,
    );
  }
}