import 'dart:async';
import 'package:bloc/bloc.dart';
import 'index.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  @override
  LanguageState get initialState => SetLanguage('id');

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if(event is ChangeLanguage){
      yield SetLanguage(event.languageCode);
    }
  }
}
