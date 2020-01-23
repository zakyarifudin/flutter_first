import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_first/Screen/Home/CustomDrawer.dart';
import 'package:flutter_first/Screen/Home/CustomPopUpMenu.dart';
import 'package:flutter_first/Screen/Home/MenuItem.dart';
import 'package:flutter_first/language/App_localizations.dart';
import '../ImageList/index.dart';

class MyHomePage extends StatefulWidget {
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
        title: Text(AppLocalizations.of(context).translate("My Home")),
        actions: <Widget>[
          CustomPopUpMenu()
        ],
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      //endDrawer: customPopUpMenu(),
      body: SafeArea(
        child: Center(
          child: _bottomOptions.elementAt(_selectedIndex)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(AppLocalizations.of(context).translate('Home')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text(AppLocalizations.of(context).translate('Images')),
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
      crossAxisCount: MediaQuery.of(context).size.height > MediaQuery.of(context).size.width ? 2 : 4,
      children: <Widget>[
        MenuItem(title: AppLocalizations.of(context).translate('Counter') , route: '/bloc', color: Colors.orangeAccent),
        MenuItem(title: AppLocalizations.of(context).translate('Infinite List'), route: '/infinite-list', color: Colors.green),
        MenuItem(title: AppLocalizations.of(context).translate('My Finance'), route: '/my-financial'),
        MenuItem(title: AppLocalizations.of(context).translate('My Form'), route: '/my-form', color: Colors.black),
        MenuItem(title: AppLocalizations.of(context).translate('Charts'), route: "/charts", color: Colors.deepPurple),
        MenuItem(title: AppLocalizations.of(context).translate('Intro'), route: "/intro", color: Colors.redAccent),
      ],
    );
  }
}

