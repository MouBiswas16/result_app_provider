import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  String _result = "";
  bool _isPassed = false;

  String get result => _result;
  bool get isPassed => _isPassed;

  void examResult(int marks) {
    if (marks >= 300) {
      // You are passed
      passed();
    } else {
      // You are failed
      failed();
    }
  }

  void passed() {
    _result = "You are passed";
    _isPassed = true;
    notifyListeners();
  }

  void failed() {
    _result = "You are failed";
    _isPassed = false;
    notifyListeners(); 
  }
}
