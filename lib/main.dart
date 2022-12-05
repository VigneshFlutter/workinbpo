import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/provider/profile_provider.dart';
import 'package:nav2/splash_screen/splash_screen.dart';
import 'package:nav2/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // height = MediaQuery.of(context).size.height ; 
    // width = MediaQuery.of(context).size.width ; 

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()) ,
        ChangeNotifierProvider(create: (_)=> InternetProvider()) ,
    ],
    child: MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primaryColor: const Color(0xff2F8D46),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    ),);
  }
}


