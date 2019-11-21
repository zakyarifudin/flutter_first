import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/Home/HomeBloc.dart';
import 'package:flutter_first/Screen/Home/index.dart';
//import 'package:flutter_first/Screen/Home/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Rumahku'));
      case '/bloc':
        //return MaterialPageRoute(builder: (_) => HomeBloc());
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeBloc(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
          },
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('Kesasar Kon rute ${settings.name} iki ra ana')),
                ));
    }
  }
}