import 'package:flutter/material.dart';
import 'package:flutter_first/routes.dart';
import 'package:flutter_first/Bloc/Simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import './Screen/SplashScreen/index.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
      //initialRoute: '/',
    );
  }
}