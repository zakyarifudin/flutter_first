import 'package:flutter/material.dart';


class CustomPopUpMenu extends StatefulWidget {
  @override
  _CustomPopUpMenuState createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {

  int itemSelected;
  List<PopupMenuEntry<Object>> list = [];

  void onSelected(value){
    if(value != 0){
      setState(() {
        itemSelected = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      itemSelected = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          color: Colors.black,
          width: 5
        )
      ),
      offset: Offset(0, 70),
      onSelected: onSelected,
      itemBuilder: (context) {
        var list = List<PopupMenuEntry<Object>>();
        list.add(
          PopupMenuItem(
            child: Text("Setting Language", style: TextStyle(fontWeight: FontWeight.bold)),
            value: 0,
          ),
        );
        list.add(
          PopupMenuDivider(
            height: 10,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "English",
              style: TextStyle(color: Colors.black),
            ),
            value: 1,
            checked: itemSelected == 1 ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "Indonesia",
              style: TextStyle(color: Colors.black),
            ),
            value: 2,
            checked: itemSelected == 2 ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "العربية",
              style: TextStyle(color: Colors.black),
            ),
            value: 3,
            checked: itemSelected == 3 ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "日本語",
              style: TextStyle(color: Colors.black),
            ),
            value: 4,
            checked: itemSelected == 4 ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "한국어",
              style: TextStyle(color: Colors.black),
            ),
            value: 5,
            checked: itemSelected == 5 ? true : false,
          ),
        );
        
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "简体中文",
              style: TextStyle(color: Colors.black),
            ),
            value: 6,
            checked: itemSelected == 6 ? true : false,
          ),
        );
        return list;
      },
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
