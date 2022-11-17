import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';


class AppLoadingscreen extends StatelessWidget {
AppLoadingscreen({Key? key}) : super(key: key);

  double? height ; 
  double? width ; 

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height ; 
    width = MediaQuery.of(context).size.width ; 
    
     return SizedBox(
            height: height,
            width: width,
            child: Center(
              child: Lottie.asset(COLOR_LOADING, height: 95, width: 125),
            ),
          );
  }
}