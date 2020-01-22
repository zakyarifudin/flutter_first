import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final List<CustomDrawerCardData> profil = [
    CustomDrawerCardData(
      icon: Icons.account_circle,
      title: "Profil",
      body: "Your Profil Detail",
      color: Colors.lightBlueAccent
    ),
    CustomDrawerCardData(
      icon: Icons.star_border,
      title: "Favorite",
      body: "Your Topic Favorite",
      color: Colors.amber
    ),
    CustomDrawerCardData(
      icon: Icons.account_balance_wallet,
      title: "Balance",
      body: "Balance Detail",      
      color: Colors.blue
    ),
  ];

  final List<CustomDrawerCardData> entertainment = [
    CustomDrawerCardData(
      icon: Icons.save_alt,
      title: "Download",
      body: "Your download files",
      color: Colors.green
    ),
    CustomDrawerCardData(
      icon: Icons.music_note,
      title: "Musics",
      body: "All Music in the world",
      color: Colors.pink
    ),
    CustomDrawerCardData(
      icon: Icons.video_library,
      title: "Videos",
      body: "Trend videos and more",
      color: Colors.red
    ),
    CustomDrawerCardData(
      icon: Icons.add_shopping_cart,
      title: "Shopping",
      body: "Buy more our products",
      color: Colors.orange
    ),
    CustomDrawerCardData(
      icon: Icons.add_alarm,
      title: "Reminder",
      body: "Make your reminder",
      color: Colors.cyan
    ),
  ];

  final List<CustomDrawerCardData> last = [
    CustomDrawerCardData(
      icon: Icons.message,
      title: "Help",
      body: "Ask Question in here",
      color: Colors.purple
    ),
    CustomDrawerCardData(
      icon: Icons.label_outline,
      title: "Logout",
      color: Colors.teal
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.white,
                  Colors.blue,
                ],
                radius: 0.7
              )
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text(
                    "Zaky Arifudin",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
          ),
          CustomDrawerGroup(list: profil),
          CustomDrawerGroup(list: entertainment),
          CustomDrawerGroup(list: last),
        ],
      ),
    );
  }
}

class CustomDrawerGroup extends StatelessWidget {

  CustomDrawerGroup({@required this.list});

  final List<CustomDrawerCardData> list;
  
  List<Widget> finalWidgetList(){

    List<Widget> widgetList = [];

    list.map((data){
      int index = list.indexOf(data);
      widgetList.add(CustomDrawerCard(data: data));
      if(index < list.length-1){
        widgetList.add(CustomDrawerCardDivider());
      }
    }).toList();

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5), 
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: finalWidgetList()
        )
      ),
    );
  }
}


class CustomDrawerCard extends StatelessWidget {

  CustomDrawerCard({Key key, this.data}) : super(key: key);

  final CustomDrawerCardData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(data.title);
      },
      child: Container(
        color: Colors.transparent,
        width: 280, // untuk bisa ditap
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                data.icon,
                size: 30,
                color: data.color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                data.body != ''
                ?
                  Text(
                    data.body,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawerCardDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 1, 
        child: Container(
          color: Colors.grey,
        )
      ),
    );
  }
}

class CustomDrawerCardData{
  CustomDrawerCardData({
    this.icon,
    this.title,
    this.body = '',
    this.color = Colors.black
  });

  final IconData icon;
  final String title;
  final String body;
  final Color color;
}

