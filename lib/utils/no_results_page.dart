import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/utils/constants.dart';

class NoResultsPage extends StatelessWidget {
  NoResultsPage({super.key});

  double? height ; 
  double? width ; 

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(NO_RESULTS , height: 150 , width: 150) , 
        const SizedBox(height: 15,) , 
        const Text('No Results Found' , 
        style: TextStyle(
          fontSize: 16 , 
          fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}