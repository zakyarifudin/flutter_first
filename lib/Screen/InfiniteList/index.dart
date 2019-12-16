import 'package:flutter/material.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times cuk:',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Zaky Nyoba Infinite List'
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
