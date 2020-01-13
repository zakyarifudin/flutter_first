import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/Home/HomeBloc.dart';
import 'package:flutter_first/Screen/Home/index.dart';
import 'package:flutter_first/Screen/InfiniteList/index.dart';
import 'package:flutter_first/Screen/InfiniteList/detail.dart';
import 'package:flutter_first/Screen/MyFinancial/index.dart';
import 'package:flutter_first/Screen/MyForm/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    Map<String, dynamic> args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Rumahku'));
      case '/bloc':
        return PageAnimation(screen: HomeBloc());
      case '/infinite-list':
        return PageAnimation(screen: InfiniteList());
      case '/post-detail':
        return PageAnimation(screen: PostDetail(id: args['id']));
      case '/my-financial':
        return PageAnimation(screen: MyFinancial());
      case '/my-form':
        return PageAnimation(screen: MyForm());
      default:      
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('Kesasar Kon rute ${settings.name} iki ra ana')),
                )
        );
    }
  }
}

class PageAnimation extends PageRouteBuilder {

  final Widget screen;

  PageAnimation({@required this.screen}) : 
  super(pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
    }); 
}