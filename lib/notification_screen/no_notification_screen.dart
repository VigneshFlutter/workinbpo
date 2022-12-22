import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/utils/constants.dart';

class NoNotificationScreen extends StatefulWidget {
  const NoNotificationScreen({Key? key}) : super(key: key);

  @override
  State<NoNotificationScreen> createState() => _NoNotificationScreenState();
}

class _NoNotificationScreenState extends State<NoNotificationScreen> {

  double? height ;
  double? width ;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          children: [
            Lottie.asset(NO_RESULTS , height: 150, width: 200,)  ,

            const SizedBox(height: 20,) ,

            const Text('No notifications found' ,
            style: TextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.w600
            ))
          ],
        ),
      ),
    );
  }
}
