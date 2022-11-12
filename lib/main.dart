import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/splash_screen/splash_screen.dart';
import 'package:nav2/utils/constants.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // height = MediaQuery.of(context).size.height ; 
    // width = MediaQuery.of(context).size.width ; 

    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}


