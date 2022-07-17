// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong try again`
  String get somethingWentWrongTryAgain {
    return Intl.message(
      'Something went wrong try again',
      name: 'somethingWentWrongTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Sort Descending`
  String get sortDesc {
    return Intl.message(
      'Sort Descending',
      name: 'sortDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sort Ascending`
  String get sortAsc {
    return Intl.message(
      'Sort Ascending',
      name: 'sortAsc',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Category all`
  String get category {
    return Intl.message(
      'Category all',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get categoryElectronics {
    return Intl.message(
      'Electronics',
      name: 'categoryElectronics',
      desc: '',
      args: [],
    );
  }

  /// `Jewelery`
  String get categoryJewelery {
    return Intl.message(
      'Jewelery',
      name: 'categoryJewelery',
      desc: '',
      args: [],
    );
  }

  /// `Men's clothing`
  String get categoryMen {
    return Intl.message(
      'Men\'s clothing',
      name: 'categoryMen',
      desc: '',
      args: [],
    );
  }

  /// `Women's clothing`
  String get categoryWomen {
    return Intl.message(
      'Women\'s clothing',
      name: 'categoryWomen',
      desc: '',
      args: [],
    );
  }

  /// `Rating: all`
  String get ratingAll {
    return Intl.message(
      'Rating: all',
      name: 'ratingAll',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 2`
  String get rating2 {
    return Intl.message(
      'Rating: 2',
      name: 'rating2',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 3`
  String get rating3 {
    return Intl.message(
      'Rating: 3',
      name: 'rating3',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 4`
  String get rating4 {
    return Intl.message(
      'Rating: 4',
      name: 'rating4',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 5`
  String get rating5 {
    return Intl.message(
      'Rating: 5',
      name: 'rating5',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
