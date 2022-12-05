import 'package:flutter/material.dart';
import 'package:nav2/model/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel? _data ;
  ProfileModel get data => _data! ;

  void updateValues(ProfileModel getdata) {
    print('The Profile update values $getdata');
    _data = getdata ;
    notifyListeners();
  }
}