
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/Home/index.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreen createState() => new _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MyHomePage(title: "Rumahku"),
      title: Text('YEY',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.asset('images/bombilla.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Indonesia"),
      loaderColor: Colors.blue,
      loadingText: Text('FROM ZAKY', 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.blue
        ),
      ),
    );
  }
}