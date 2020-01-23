//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/Bloc/Counter/index.dart';
import 'package:flutter_first/language/App_localizations.dart';

class HomeBloc extends StatelessWidget {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: counterBloc,
      builder: (context, state) { 
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon : Icon(Icons.arrow_back_ios, size: 20), 
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(AppLocalizations.of(context).translate("Counter")),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate("Counter Pushed"),
                ),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  AppLocalizations.of(context).translate("Zaky Try Bloc"),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              FloatingActionButton(
                heroTag: 'bloc1',
                onPressed: () => counterBloc.add(Increment()),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'bloc2',
                onPressed: () => counterBloc.add(Decrement()),
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'bloc3',
                onPressed: () => counterBloc.add(Reset()),
                tooltip: 'Reset',
                child: Icon(Icons.clear),
              )
            ]
            
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
    );
  }
}
