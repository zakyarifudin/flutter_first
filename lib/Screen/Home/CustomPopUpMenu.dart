import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/Bloc/Language/index.dart';
import 'package:flutter_first/language/App_localizations.dart';


class CustomPopUpMenu extends StatefulWidget {
  @override
  _CustomPopUpMenuState createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {

  String itemSelected;
  List<PopupMenuEntry<Object>> list = [];

  @override
  Widget build(BuildContext context) {
   
    //ignore: close_sinks
    final _languageBloc = BlocProvider.of<LanguageBloc>(context);

    setState(() {
      itemSelected = _languageBloc.state.languageCode;
    });

    void onSelected(value){
      if(value != 0){
        setState(() {
          itemSelected = value;
        });
        _languageBloc.add(ChangeLanguage(value));
      }
    }

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
            child: Text(
              AppLocalizations.of(context).translate('Setting Language'),
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
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
               AppLocalizations.of(context).translate('English'),
              style: TextStyle(color: Colors.black),
            ),
            value: "en",
            checked: itemSelected == "en" ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "Indonesia",
              style: TextStyle(color: Colors.black),
            ),
            value: "id",
            checked: itemSelected == "id" ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "العربية",
              style: TextStyle(color: Colors.black),
            ),
            value: "ar",
            checked: itemSelected == "ar" ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "日本語",
              style: TextStyle(color: Colors.black),
            ),
            value: "ja",
            checked: itemSelected == "ja" ? true : false,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "한국어",
              style: TextStyle(color: Colors.black),
            ),
            value: "ko",
            checked: itemSelected == "ko" ? true : false,
          ),
        );
        
        list.add(
          CheckedPopupMenuItem(
            child: Text(
              "简体中文",
              style: TextStyle(color: Colors.black),
            ),
            value: "cn",
            checked: itemSelected == "cn" ? true : false,
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
