import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';
import 'hSpacer.dart';

class InternetViewer extends StatelessWidget {
  InternetViewer({Key? key}) : super(key: key);

  double? height ;
  double? width ;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Lottie.asset(NOTIFICATION_BELL , height: 200 , width: 200) ,
          hSpacer().hSpace10() ,
          const Text('No internet connection' ,
            style: TextStyle(
              fontSize: 16 ,
              fontWeight: FontWeight.w700 ,
            ),)
        ],
      ),
    );
  }
}