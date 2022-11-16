import 'dart:core';

import 'package:nav2/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void savingToken(String data) async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(USER_TOKEN, data);
}