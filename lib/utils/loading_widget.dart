import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/utils/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(COLOR_LOADING , height: 65 , width: 85),
    );
  }
}
