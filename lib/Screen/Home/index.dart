import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_first/Screen/Home/CustomDrawer.dart';
import 'package:flutter_first/Screen/Home/MenuItem.dart';
import '../ImageList/index.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _bottomOptions = <Widget>[
    Home(),
    ImageList()
  ];

  final FirebaseMessaging _fcm = FirebaseMessaging();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _fcm.getToken().then((token){
      print(token);
    });
    // untuk fcm nya
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
                ),
                actions: <Widget>[
                FlatButton(
                    child: Text('Ok'),
                    onPressed: () => 
                      Navigator.pushNamed(
                        context,
                        message['data']['route'],
                        arguments :{ "id" : int.parse(message['data']['id']) }
                      ).then((result) {
                        Navigator.of(context).pop();
                      })
                ),
              ],
            ),
          );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToScreen(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToScreen(message);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToScreen(Map<String, dynamic> message) {
    final route = message['data']['route'];
    final id = int.parse(message['data']['id']);
    Navigator.pushNamed(
      context,
      route,
      arguments :{ "id" : id }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          InkWell(
            onTap: (){
              print("More Detail");
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert, size: 30,)
            )
          )
        ],
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SafeArea(
        child: Center(
          child: _bottomOptions.elementAt(_selectedIndex)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Images'),
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
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        MenuItem(title: 'Counter', route: '/bloc', color: Colors.orangeAccent),
        MenuItem(title: 'Infinite List', route: '/infinite-list', color: Colors.green),
        MenuItem(title: 'My Finance', route: '/my-financial'),
        MenuItem(title: 'My Form', route: '/my-form', color: Colors.black),
        MenuItem(title: "Charts", route: "/charts", color: Colors.deepPurple),
      ],
    );
  }
}

