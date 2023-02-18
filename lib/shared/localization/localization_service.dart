import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../local_storage_service.dart';
import 'ar_eg.dart';
import 'en_us.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('ar', 'EG');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'EG'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // en_us.dart
        'ar_EG': arEG, // tr_tr.dart
      };

  String getCurrentLanguage() {
    return LocalStorageService.getData(key: 'edriver-lang') ?? 'Arabic';
  }

  Locale getCurrentLocate() {
    return _getLocaleFromLanguage(getCurrentLanguage());
  }

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
    LocalStorageService.saveData(key: 'edriver-lang', value: lang);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return locale;
  }
}
