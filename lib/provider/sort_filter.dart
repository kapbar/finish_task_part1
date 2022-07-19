import 'package:flutter/material.dart';

class SortFilterProducts with ChangeNotifier {
  String dropDownValue = 'desc';
  String dropDownValue1 = '';
  double dropDownValue2 = 0.0;

  void sortProducts(String value) {
    dropDownValue = value;
    notifyListeners();
  }

  void categoryProducts(String value) {
    dropDownValue1 = value;
    notifyListeners();
  }

  void ratingProducts(double value) {
    dropDownValue2 = value;
    notifyListeners();
  }
}
