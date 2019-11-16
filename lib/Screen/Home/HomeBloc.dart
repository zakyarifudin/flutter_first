//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/Bloc/Counter/index.dart';

class HomeBloc extends StatelessWidget {

  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
          bloc: counterBloc,
          builder: (context, state) { 
            return Scaffold(
              appBar: AppBar(
                title: Text('Coba BLOC Cuk!'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times cuk:',
                    ),
                    Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(
                      'Zaky Nyoba Bloc'
                    )
                  ],
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  FloatingActionButton(
                    onPressed: () => counterBloc.add(CounterEvent.increment),
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () => counterBloc.add(CounterEvent.decrement),
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () => counterBloc.add(CounterEvent.reset),
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
