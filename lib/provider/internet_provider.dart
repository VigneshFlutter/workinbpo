import 'package:flutter/material.dart';

class InternetProvider extends ChangeNotifier {
  
  bool? _isInternet ; 
  bool get isInternet => _isInternet! ;

  void updateValues(bool val){
    _isInternet = val ;
    notifyListeners();
  }
}