import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/Bloc/Language/index.dart';
import 'package:flutter_first/language/App_localizations.dart';
import 'package:flutter_first/routes.dart';
import 'package:flutter_first/Bloc/Simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './Screen/SplashScreen/index.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => LanguageBloc(),
      child: Main()
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final languageBloc = BlocProvider.of<LanguageBloc>(context);

    return BlocBuilder<LanguageBloc, LanguageState>(
      bloc: languageBloc,
      builder: (context, state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MySplashScreen(),
          onGenerateRoute: RouteGenerator.generateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('id', 'ID'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale(state.languageCode),
        );
      }
    );
  }
}