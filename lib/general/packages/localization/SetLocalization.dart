import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationHelper {
  late final Locale locale;

  LocalizationHelper(Locale locale){
    this.locale=locale;
  }

  static LocalizationHelper? of(BuildContext context) {
    return Localizations.of<LocalizationHelper>(context, LocalizationHelper);
  }

  static const LocalizationsDelegate<LocalizationHelper> localizationsDelegate = _GetLocalizationDelegate();

  Map<String, String> _localizedValues={};


  Future load() async {
    String jsonStringValues = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslateValue(String key) {
    return _localizedValues[key]??"";
  }
}

class _GetLocalizationDelegate extends LocalizationsDelegate <LocalizationHelper> {

  const _GetLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationHelper> load(Locale locale) async {
    // TODO: implement load
    LocalizationHelper localization =  LocalizationHelper(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationHelper> old) {
    // TODO: implement shouldReload
    return false;
  }
}
