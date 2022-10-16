import 'package:flutter/material.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/managemessages/manage_messages.dart';

import '../utils/constants.dart';

class shortlisted3 extends StatefulWidget {
  const shortlisted3({Key? key}) : super(key: key);

  @override
  State<shortlisted3> createState() => _shortlisted3State();
}

class _shortlisted3State extends State<shortlisted3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => managemessages(),
                      ),
                    ),
                child: Icon(Icons.notifications)),
          )
        ],
        title: Center(
            child: Container(
                width: 80, child: Image.asset(APP_LOGO))),
        backgroundColor: whitecolor,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 15),
                  child: Text('Job Applications',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                ),
            Padding(
                 padding: const EdgeInsets.only(left:5,right: 5),
                  child: Card(
                    elevation: 1,
                    child: Center(
                      child: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/job7.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Subhasrini TS',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => managemessages(),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 0,
                                ),
                                child: Container(
                                    width: 80,
                                    height: 30,
                                    child: Center(
                                        child: Text("View More ",
                                            style: TextStyle(
                                                color: buttoncolor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700))),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8), // radius of 10
                                      color: whitecolor,
                                      border: Border.all(color: buttoncolor)
                                      // green as background color
                                    )),
                              ),
                            ),
                          ),
                                          ],
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                            Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                            '32000 INR /',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,color:Colors.green)),
                                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, bottom: 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        ' Weekly',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                      ],
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Chennai',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'India',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                 padding: const EdgeInsets.only(left:5,right: 5),
                  child: Card(
                    elevation: 1,
                    child: Center(
                      child: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/job6.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Ganeshan',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => managemessages(),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 79,
                                  right: 0,
                                ),
                                child: Container(
                                    width: 80,
                                    height: 30,
                                    child: Center(
                                        child: Text("View More ",
                                            style: TextStyle(
                                                color: buttoncolor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700))),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8), // radius of 10
                                      color: whitecolor,
                                      border: Border.all(color: buttoncolor)
                                      // green as background color
                                    )),
                              ),
                            ),
                          ),
                                          ],
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                            Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                            '50000 INR /',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,color:Colors.green)),
                                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, bottom: 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        ' Weekly',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                      ],
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Madhurai',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'India',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                ),



                Padding(
                 padding: const EdgeInsets.only(left:5,right: 5),
                  child: Card(
                    elevation: 1,
                    child: Center(
                      child: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/job6.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Suba Ganeshan',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => managemessages(),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 31,
                                  right: 0,
                                ),
                                child: Container(
                                    width: 80,
                                    height: 30,
                                    child: Center(
                                        child: Text("View More ",
                                            style: TextStyle(
                                                color: buttoncolor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700))),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8), // radius of 10
                                      color: whitecolor,
                                      border: Border.all(color: buttoncolor)
                                      // green as background color
                                    )),
                              ),
                            ),
                          ),
                                          ],
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                            Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                            '100000 INR /',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,color:Colors.green)),
                                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, bottom: 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        ' Weekly',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                      ],
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Coimbatore',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'India',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


          ],
        )),
    );
    
  }
}