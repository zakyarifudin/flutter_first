import 'package:flutter/material.dart';
import 'package:flutter_first/Bloc/InfiniteList/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetail extends StatelessWidget {

  final postId;

  PostDetail({@required this.postId});

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail $postId'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Column(
            children: <Widget>[
              Text("Post Id $postId"),
              Text("Post Title"),
              Text("Post Body"),
            ],
          ),
        ),
      )
    );
  }
}