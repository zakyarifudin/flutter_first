import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _bottomOptions = <Widget>[
    Home(),
    Schedule()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _bottomOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Scedule'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/bloc');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          textColor: Colors.white,
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Menyang BloC',
              style: TextStyle(fontSize: 20)
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/bloc');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Infinite List',
                style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          textColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Tara',
              style: TextStyle(fontSize: 20)
            ),
          ),
        ),
      ],
    );
  }
}
