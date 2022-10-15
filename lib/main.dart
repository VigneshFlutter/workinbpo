import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav2/loginpage/Admin_login.dart';

import 'package:nav2/bottom_navigation.dart';

import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';

import 'package:nav2/edit_profile.dart';

import 'package:nav2/Registerpage.dart';

import 'package:nav2/jobplan/job_goldplan.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/managemessages/manage_messages_receiv.dart';
import 'package:nav2/postjobs/post_a_newjob.dart';
import 'package:nav2/postjobs/post_job.dart';



import 'package:nav2/shortlistedprofile/shortlistedprofile1.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile2.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile3.dart';
import 'loginpage/login_page.dart';

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
      home: bottom_navigation()
    );
  }
}


