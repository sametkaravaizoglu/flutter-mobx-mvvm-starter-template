import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance;
  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final trLocale = Locale("tr", "TR");
  final String defaultLang = "tr_TR";

  List<Locale> get supportedLocales => [trLocale];
  String get defaultLanguage => defaultLang;

  String get appname => "DOD";
}
