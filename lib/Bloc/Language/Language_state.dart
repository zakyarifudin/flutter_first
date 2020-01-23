import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LanguageState extends Equatable {
  final String languageCode;

  LanguageState(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}

class SetLanguage extends LanguageState{
    SetLanguage(languageCode) : super(languageCode);
}


