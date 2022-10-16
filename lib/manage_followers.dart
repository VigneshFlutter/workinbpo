import 'package:flutter/material.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/loginpage/login_page.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/post_job.dart';
import 'package:nav2/utils/constants.dart';

class managefollowers extends StatefulWidget {
  const managefollowers({Key? key}) : super(key: key);

  @override
  State<managefollowers> createState() => _managefollowersState();
}

class _managefollowersState extends State<managefollowers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Container(
          width: 80,
          child: Image.asset(APP_LOGO)),
          backgroundColor: whitecolor,
            iconTheme: IconThemeData(color: blackcolor),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, bottom: 20),
                child: Text(
                  'Company Messages',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ),
              Card(
                  elevation: 10,
                  
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Colors.amber,width: 4),)
  ),
                    width: 350,
                    height: 230,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset('assets/amazon.jpeg')),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 10),
                                      child: Text(
                                        'subhasrini T s',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text('Guatemala',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                         InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 5, top: 0),
                                      child: Container(
                                          width: 300,
                                          height: 40,
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              
                                              Text("View Profile",
                                                  style: TextStyle(
                                                    color: buttoncolor,
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          )),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  10), // radius of 10
                                              color: whitecolor,
                                              border: Border.all(
                                                  color: buttoncolor,
                                                  width: 2)
                                              // green as background color
                                              )),
                                    ),
                                  ),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 20),
                                   child: Text('Conway has been sent call for interview',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                 ),

                                
                      ],
                    ),
                  )),
            ]),
          ),
        ),
      ),
      
    );
  }
}
