import 'package:meta/meta.dart';

@immutable
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);

  @override
  String toString() => 'Language code : $languageCode';
}