import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/Home/HomeBloc.dart';
import 'package:flutter_first/Screen/Home/index.dart';
import 'package:flutter_first/Screen/InfiniteList/index.dart';
import 'package:flutter_first/Screen/InfiniteList/detail.dart';
import 'package:flutter_first/Bloc/InfiniteList/index.dart' show Post;


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Rumahku'));
      case '/bloc':
        return PageAnimation(screen: HomeBloc());
      case '/infinite-list':
        return PageAnimation(screen: InfiniteList());
      case '/post-detail':
        Post args = settings.arguments;
        return PageAnimation(screen: PostDetail(postId: args.id));
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