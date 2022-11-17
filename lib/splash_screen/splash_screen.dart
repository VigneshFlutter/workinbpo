import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/internet_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double? height ;
  double? width ;

  @override
  void initState() {
    choosingScreen();
    super.initState();
  }

  void checkConnectivity() async {
    var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.mobile){
        Provider.of<InternetProvider>(context , listen: false).updateValues(true);
      }else if(result == ConnectivityResult.wifi){
        Provider.of<InternetProvider>(context , listen: false).updateValues(true);
      }else{
        Provider.of<InternetProvider>(context , listen: false).updateValues(false);
      }
    });
  }

  void choosingScreen() async{
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    if(token == null){
      Navigator.push(
          context, MaterialPageRoute(builder: (context)=> adminlogin()));
    }else{
      Navigator.push(
          context, MaterialPageRoute(builder: (context)=> bottom_navigation()));
    }
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(APP_LOGO , height: 125,) ,
          const SizedBox(height: 30,) ,
          const Text('Knownjobz' ,
          style: TextStyle(
            fontSize: 18 ,
            fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }
}
