import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_first/language/App_localizations.dart';

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppLocalizations.of(context).translate("Charts")),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ChartWidget(
              title: "Bar Chart", 
              route: "/charts/bar"
            )
          ],
        ),
      ),
    );
  }
}


class ChartWidget extends StatelessWidget {

  ChartWidget({Key key, @required this.title, @required this.route}) : super(key: key);

  final String title;
  final String route;
  final random = new Random();

  final List<Color> colors = [
    Color(0xff8A8AEA),
    Color(0xff34C1D5),
    Color(0xffFCAEAE),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(7),
          elevation: 7,
          color: colors[random.nextInt(3)],
          child: Center(
            child: Text(
              AppLocalizations.of(context).translate(title),
              style: TextStyle(
                color: Colors.white,
                fontSize: 27
              ),
            ),
          )
        ),
      ),
    );
  }
}
