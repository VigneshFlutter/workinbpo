import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/chart.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/home.dart';
import 'package:nav2/homedesign/Home_design_page.dart';
import 'package:nav2/Registerpage.dart';
import 'package:nav2/checkbox.dart';
import 'package:nav2/job_plan.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/manage_messages.dart';
import 'package:nav2/manage_messages_receiv.dart';
import 'package:nav2/post_job.dart';
import 'login_page.dart';

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
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


