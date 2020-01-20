import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({Key key, @required this.title, @required this.route, this.color}) : super(key: key);

  final String route;
  final String title;
  final Color color;

  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color ?? Colors.blueAccent,
        ),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
          ),
        )
      ),
    );
  }
}