import 'package:flutter/material.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/jobplan/job_diamondplan.dart';
import 'package:nav2/jobplan/job_goldplan.dart';
import 'package:nav2/loginpage/login_page.dart';

import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/managemessages/manage_messages_receiv.dart';
import 'package:nav2/openjob.dart';
import 'package:nav2/postjobs/post_job.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

const buttoncolor = const Color.fromARGB(255, 26, 181, 195);
const whitecolor = Color.fromARGB(255, 255, 255, 255);
const blackcolor = Color.fromARGB(255, 0, 0, 0);
const greycolor = Colors.grey;
const bluecolor =  Color.fromARGB(255, 15, 28, 216);
const lightbluecolor =  Color.fromARGB(255, 176, 195, 249);



class dashboardpage extends StatefulWidget {
  const dashboardpage({Key? key}) : super(key: key);

  @override
  State<dashboardpage> createState() => _dashboardpageState();
}

class _dashboardpageState extends State<dashboardpage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

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
                width: 80, child: Image.asset('assets/work in bpo.png'))),
        backgroundColor: whitecolor,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   width: 150,
                //   height: 150,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Card(
                //         elevation: 5,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //         child: InkWell(
                //           onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => managejob(),
                //             ),
                //           ),
                //           child: Container(
                //             width: 150,
                //             height: 150,
                //             child: Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color:
                //                             Color.fromARGB(255, 175, 219, 255),
                //                         borderRadius: BorderRadius.circular(5)),
                //                     width: 60,
                //                     height: 60,
                //                     child: Icon(
                //                       Icons.lock_person_outlined,
                //                       size: 35,
                //                       color: Color.fromARGB(255, 84, 110, 236),
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '6',
                //                         style: TextStyle(
                //                             color:
                //                                 Color.fromARGB(255, 0, 71, 212),
                //                             fontSize: 28),
                //                       ),
                //                       Text(
                //                         'Open Jobs',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(255, 0, 0, 0),
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w700),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Card(
                //         elevation: 5,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //         child: InkWell(
                //           onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => managefollowers(),
                //             ),
                //           ),
                //           child: Container(
                //             width: 150,
                //             height: 150,
                //             child: Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color:
                //                             Color.fromARGB(255, 179, 255, 181),
                //                         borderRadius: BorderRadius.circular(5)),
                //                     width: 60,
                //                     height: 60,
                //                     child: Icon(
                //                       Icons.file_copy_outlined,
                //                       size: 35,
                //                       color: Color.fromARGB(255, 89, 253, 74),
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         ' 1',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(
                //                                 255, 14, 227, 82),
                //                             fontSize: 28),
                //                       ),
                //                       Text(
                //                         'Followers',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(255, 0, 0, 0),
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w700),
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Card(
                //         elevation: 5,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //         child: InkWell(
                //           onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => managemessages(),
                //             ),
                //           ),
                //           child: Container(
                //             width: 150,
                //             height: 150,
                //             child: Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color:
                //                             Color.fromARGB(255, 255, 253, 146),
                //                         borderRadius: BorderRadius.circular(5)),
                //                     width: 60,
                //                     height: 60,
                //                     child: Icon(
                //                       Icons.mail_outlined,
                //                       size: 35,
                //                       color: Color.fromARGB(255, 219, 194, 4),
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '3',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(
                //                                 255, 245, 226, 13),
                //                             fontSize: 28),
                //                       ),
                //                       Text(
                //                         'Messages',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(255, 0, 0, 0),
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w700),
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Card(
                //         elevation: 5,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //         child: InkWell(
                //           onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => managejob(),
                //             ),
                //           ),
                //           child: Container(
                //             width: 150,
                //             height: 150,
                //             child: Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color:
                //                             Color.fromARGB(255, 255, 181, 191),
                //                         borderRadius: BorderRadius.circular(5)),
                //                     width: 60,
                //                     height: 60,

                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(top: 10),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '6',
                //                         style: TextStyle(
                //                             color: Colors.blue, fontSize: 28),
                //                       ),
                //                       Text(
                //                         'Shortlisted Profiles',
                //                         style: TextStyle(
                //                             color: Color.fromARGB(255, 0, 0, 0),
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w700),
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: Card(
                //     elevation: 4,
                //     child: InkWell(
                //       onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => managejob(),
                //         ),
                //       ),
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(5)),
                //         height: 100,
                //         width: 370,
                //         child: Row(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 20, right: 200),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Color.fromARGB(255, 175, 219, 255),
                //                     borderRadius: BorderRadius.circular(5)),
                //                 width: 60,
                //                 height: 60,
                //                 child: Icon(
                //                   Icons.lock_person_outlined,
                //                   size: 35,
                //                   color: Color.fromARGB(255, 84, 110, 236),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 24),
                //               child: Column(
                //                 children: [
                //                   Text(
                //                     '6',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 0, 71, 212),
                //                         fontSize: 28),
                //                   ),
                //                   Text(
                //                     'Open Jobs',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 0, 0, 0),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w700),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: Card(
                //     elevation: 4,
                //     child: InkWell(
                //       onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => managefollowers(),
                //         ),
                //       ),
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(5)),
                //         height: 100,
                //         width: 370,
                //         child: Row(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 20, right: 200),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Color.fromARGB(255, 179, 255, 181),
                //                     borderRadius: BorderRadius.circular(5)),
                //                 width: 60,
                //                 height: 60,
                //                 child: Icon(
                //                   Icons.file_copy_outlined,
                //                   size: 35,
                //                   color: Color.fromARGB(255, 89, 253, 74),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 24),
                //               child: Column(
                //                 children: [
                //                   Text(
                //                     ' 1',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 14, 227, 82),
                //                         fontSize: 28),
                //                   ),
                //                   Text(
                //                     'Followers',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 0, 0, 0),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w700),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: Card(
                //     elevation: 4,
                //     child: InkWell(
                //       onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => managemessages(),
                //         ),
                //       ),
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(5)),
                //         height: 100,
                //         width: 370,
                //         child: Row(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 20, right: 200),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Color.fromARGB(255, 255, 253, 146),
                //                     borderRadius: BorderRadius.circular(5)),
                //                 width: 60,
                //                 height: 60,
                //                 child: Icon(
                //                   Icons.mail_outlined,
                //                   size: 35,
                //                   color: Color.fromARGB(255, 219, 194, 4),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 24),
                //               child: Column(
                //                 children: [
                //                   Text(
                //                     '3',
                //                     style: TextStyle(
                //                         color:
                //                             Color.fromARGB(255, 245, 226, 13),
                //                         fontSize: 28),
                //                   ),
                //                   Text(
                //                     'Messages',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 0, 0, 0),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w700),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: Card(
                //     elevation: 4,
                //     child: InkWell(
                //       onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => managejob(),
                //         ),
                //       ),
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(5)),
                //         height: 100,
                //         width: 370,
                //         child: Row(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 20, right: 150),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Color.fromARGB(255, 255, 181, 191),
                //                     borderRadius: BorderRadius.circular(5)),
                //                 width: 60,
                //                 height: 60,
                //                 child: Icon(
                //                   Icons.line_style_outlined,
                //                   size: 35,
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 24),
                //               child: Column(
                //                 children: [
                //                   Text(
                //                     '      4',
                //                     style: TextStyle(
                //                         color: Colors.blue, fontSize: 28),
                //                   ),
                //                   Text(
                //                     'Shortlisted Profiles',
                //                     style: TextStyle(
                //                         color: Color.fromARGB(255, 0, 0, 0),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w700),
                //                   )
                //                 ],
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                       onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => managejob(),
                                ),
                              ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                   child: Image.asset('assets/openjob.png',width: 40,height: 40,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Open jobs',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      '6',
                                      style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 50, 153, 238)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                       onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => managefollowers(),
                                ),
                              ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                   child: Image.asset('assets/follower.png',height: 40,width: 40,color: Colors.green,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Followers',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                       onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => managemessages(),
                                ),
                              ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Icon(
                                      Icons.mail,
                                      size: 40,
                                      color: Color.fromARGB(255, 255, 231, 11),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Messages',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      '3',
                                      style: TextStyle(fontSize: 20,  color: Color.fromARGB(255, 224, 202, 7),),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                       onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => managejob(),
                                ),
                              ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                     child: Image.asset('assets/shortlist.png',height: 40,width: 40,),
                                  ),
                                   
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Shoritlisted Profiles',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      '6',
                                      style: TextStyle(
                                          fontSize: 20, color: Color.fromARGB(255, 220, 69, 101)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

               Padding(
                 padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                 child: Row(
                   children: [
                     Text(
                                  'Notifications',
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w600),
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
                                  left: 85,
                                  right: 20,
                                ),
                                child: Container(
                                    width: 80,
                                    height: 30,
                                    child: Center(
                                        child: Text("View More ",
                                            style: TextStyle(
                                                color: whitecolor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700))),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10), // radius of 10
                                      color: buttoncolor,
                                      // green as background color
                                    )),
                              ),
                            ),
                          ),
                   ],
                 ),
               ),
                Container(
                  child: Container(
                    color: whitecolor,
                    height: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => managemessagereceive(),
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        30), //add border radius
                                    child: Image.asset(
                                      "assets/job7.jpeg",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, top: 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 120),
                                            child: Text(
                                              'Subasini',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            '8.15.pm',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Text(
                                          'Conway has been sent call for interview',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Divider(
                            color: blackcolor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => managemessagereceive2(),
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        30), //add border radius
                                    child: Image.asset(
                                      "assets/job6.jpeg",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, top: 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: Text(
                                              'Ganeshan',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            '9.15.pm',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Text(
                                          'Conway has been shortlisted your profile',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Divider(
                            color: blackcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Text(
                                  'Recent Application',
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w600),
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
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Container(
                                      width: 80,
                                      height: 30,
                                      child: Center(
                                          child: Text("View More ",
                                              style: TextStyle(
                                                  color: whitecolor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700))),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10), // radius of 10
                                        color: buttoncolor,
                                        // green as background color
                                      )),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 320,
                          height: 360,
                          decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          child:
                                              Image.asset('assets/job7.jpeg')),
                                    ),
                                    Column(
                                      children: [
                                        Text('Subhasrini TR Sri',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 150, top: 5),
                                          child:
                                              Icon(Icons.location_on_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 90, top: 0, bottom: 10),
                                child: Text(
                                  'Key Skils:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: greycolor),

                                        borderRadius: BorderRadius.circular(15),),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'FLUTTER',
                                            style: TextStyle(
                                                color:blackcolor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                    
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color: greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'JAVA',
                                            style: TextStyle(color:blackcolor,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color: greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'REACT JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Card(
                                     
                                      shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'Node JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    
                                      shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        child: Text(
                                          'REACT JS',
                                          style: TextStyle(color:blackcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 0),
                                child: Text(
                                  'Salary:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 0),
                                child: Text(
                                  '300000  INR / Weekly',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 4),
                                child: Text(
                                  'Summary',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 5),
                                child: Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                           Padding(
                                padding: const EdgeInsets.only(
                                    right: 5,top: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Card(
                                   
                                       shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      width: 140,
                                      height: 35,
                                      decoration: BoxDecoration(
                                         color: buttoncolor,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 20, right: 10),
                                        child: Row(
                        
                                          children: [
                                            Icon(Icons.visibility,size: 18,),
                                            Text('  View Profile',style: TextStyle(color: whitecolor),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                        SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 320,
                          height: 360,
                          decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          child:
                                              Image.asset('assets/job7.jpeg')),
                                    ),
                                    Column(
                                      children: [
                                        Text('Subhasrini TR Sri',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 150, top: 5),
                                          child:
                                              Icon(Icons.location_on_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 90, top: 0, bottom: 10),
                                child: Text(
                                  'Key Skils:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: greycolor),

                                        borderRadius: BorderRadius.circular(15),),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'FLUTTER',
                                            style: TextStyle(
                                                color: blackcolor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                    
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color: greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'JAVA',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color: greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'REACT JS',
                                            style: TextStyle(color:blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Card(
                                     
                                      shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'Node JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    
                                      shape: RoundedRectangleBorder( side: BorderSide(color: greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        child: Text(
                                          'REACT JS',
                                          style: TextStyle(color:blackcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 0),
                                child: Text(
                                  'Salary:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 0),
                                child: Text(
                                  '300000  INR / Weekly',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 4),
                                child: Text(
                                  'Summary',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 5),
                                child: Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 5,top: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Card(
                                   
                                       shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      width: 140,
                                      height: 35,
                                      decoration: BoxDecoration(
                                         color: buttoncolor,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 20, right: 10),
                                        child: Row(
                        
                                          children: [
                                            Icon(Icons.visibility,size: 18,),
                                            Text('  View Profile',style: TextStyle(color:whitecolor),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                        SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 320,
                          height: 360,
                          decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          child:
                                              Image.asset('assets/job7.jpeg')),
                                    ),
                                    Column(
                                      children: [
                                        Text('Subhasrini TR Sri',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 150, top: 5),
                                          child:
                                              Icon(Icons.location_on_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 90, top: 0, bottom: 10),
                                child: Text(
                                  'Key Skils:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: greycolor),

                                        borderRadius: BorderRadius.circular(15),),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'FLUTTER',
                                            style: TextStyle(
                                                color: blackcolor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                    
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color:greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'JAVA',
                                            style: TextStyle(color:blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color:greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'REACT JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Card(
                                     
                                      shape: RoundedRectangleBorder( side: BorderSide(color: greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'Node JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    
                                      shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        child: Text(
                                          'REACT JS',
                                          style: TextStyle(color:blackcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 0),
                                child: Text(
                                  'Salary:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 0),
                                child: Text(
                                  '300000  INR / Weekly',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 4),
                                child: Text(
                                  'Summary',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 5),
                                child: Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.only(
                                    right: 5,top: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Card(
                                   
                                       shape: RoundedRectangleBorder( side: BorderSide(color: greycolor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      width: 140,
                                      height: 35,
                                      decoration: BoxDecoration(
                                         color: buttoncolor,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 20, right: 10),
                                        child: Row(
                        
                                          children: [
                                            Icon(Icons.visibility,size: 18,),
                                            Text('  View Profile',style: TextStyle(color: whitecolor),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                           SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 320,
                          height: 360,
                          decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          child:
                                              Image.asset('assets/job7.jpeg')),
                                    ),
                                    Column(
                                      children: [
                                        Text('Subhasrini TR Sri',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 150, top: 5),
                                          child:
                                              Icon(Icons.location_on_outlined),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 90, top: 0, bottom: 10),
                                child: Text(
                                  'Key Skils:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: greycolor),

                                        borderRadius: BorderRadius.circular(15),),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'FLUTTER',
                                            style: TextStyle(
                                                color: blackcolor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                    
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color:greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'JAVA',
                                            style: TextStyle(color:blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      
                                      shape: RoundedRectangleBorder(
                                         side: BorderSide(color:greycolor),
                                         borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'REACT JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Card(
                                     
                                      shape: RoundedRectangleBorder( side: BorderSide(color: greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 20,
                                              right: 20),
                                          child: Text(
                                            'Node JS',
                                            style: TextStyle(color: blackcolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    
                                      shape: RoundedRectangleBorder( side: BorderSide(color:greycolor),
                                      borderRadius: BorderRadius.circular(15)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        child: Text(
                                          'REACT JS',
                                          style: TextStyle(color:blackcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 0),
                                child: Text(
                                  'Salary:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 0),
                                child: Text(
                                  '300000  INR / Weekly',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, bottom: 4),
                                child: Text(
                                  'Summary',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, bottom: 5),
                                child: Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.only(
                                    right: 5,top: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Card(
                                   
                                       shape: RoundedRectangleBorder( side: BorderSide(color: greycolor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      width: 140,
                                      height: 35,
                                      decoration: BoxDecoration(
                                         color: buttoncolor,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5, left: 20, right: 10),
                                        child: Row(
                        
                                          children: [
                                            Icon(Icons.visibility,size: 18,),
                                            Text('  View Profile',style: TextStyle(color: whitecolor),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Plans & Membership',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: blackcolor),
                      ),
                     
                    ],
                  ),
                ),
                 Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                                width: 200,
                                height: 35,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("My Order & Purchases ",
                                        style: TextStyle(
                                            color:whitecolor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: CircleAvatar(
                                          minRadius: 10,
                                          backgroundColor:
                                              Color.fromARGB(255, 255, 82, 69),
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                                color: whitecolor,
                                                fontSize: 10),
                                          )),
                                    )
                                  ],
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // radius of 10
                                  color: buttoncolor,
                                  // green as background color
                                )),
                          ),
                        ),
                      ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Text(
                    'My Current Plan',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    elevation: 1,
                    child: Center(
                      child: Container(
                        height: 105,
                        child: SfDataGrid(
                          source: employeeDataSource,
                          frozenColumnsCount: 1,
                          columns: <GridColumn>[
                            GridTextColumn(
                                columnName: 'Plan Name',
                                label: Container(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Plan Name',
                                      style: TextStyle(
                                          color:buttoncolor),
                                    ))),
                            GridTextColumn(
                                columnName: 'User ID',
                                label: Container(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'User ID',
                                      style: TextStyle(
                                          color: buttoncolor),
                                    ))),
                            GridTextColumn(
                                columnName: 'Purchase Date',
                                label: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 0, right: 0),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, left: 20, right: 0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Purchase Date',
                                        style: TextStyle(
                                            color: buttoncolor),
                                      )),
                                )),
                            GridTextColumn(
                                columnName: 'Expire Date',
                                label: Container(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Expire Date',
                                      style: TextStyle(
                                          color: buttoncolor),
                                    ))),
                            GridTextColumn(
                                columnName: 'Availd Quata',
                                label: Container(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Availd Quata',
                                      style: TextStyle(
                                          color:buttoncolor),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
               SizedBox(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                     Center(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 300,
                      height: 390,
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 10, left: 20),
                            child: Text(
                              'Gold Plan',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: blackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 15, left: 20),
                            child: Text(
                              'INR \₹3000',
                              style: TextStyle(
                                  fontSize: 30,
                                  color:bluecolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 10, left: 20),
                            child: Text(
                              'what you get :',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: blackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 5, bottom: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 10, bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: lightbluecolor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.check_outlined,
                                            color:
                                               bluecolor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10),
                                        child: Text(
                                          'Can post jobs : 20',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 0, bottom: 20),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 0, bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: lightbluecolor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.check_outlined,
                                            color:
                                                bluecolor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 20),
                                        child: Text(
                                          'Package Duration : 30 Days',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => jobplangold(),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 260,
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                                "See detailed information ",
                                                style: TextStyle(
                                                  color: whitecolor,
                                                  fontSize: 16,
                                                ))),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color:
                                               bluecolor

                                            // green as background color
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                      width: 5,
                    ),
                 Center(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 300,
                      height: 390,
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 10, left: 20),
                            child: Text(
                              'Diamond Plan',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: blackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 15, left: 20),
                            child: Text(
                              'INR \₹5000',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: bluecolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 10, left: 20),
                            child: Text(
                              'what you get :',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: blackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 5, bottom: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 10, bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:lightbluecolor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.check_outlined,
                                            color:
                                                bluecolor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10),
                                        child: Text(
                                          'Can post jobs : 50',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 0, bottom: 20),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 0, bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: lightbluecolor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.check_outlined,
                                            color:
                                               bluecolor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 20),
                                        child: Text(
                                          'Package Duration : 50 Days',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => jobplandiamond(),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 260,
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                                "See detailed information ",
                                                style: TextStyle(
                                                  color: whitecolor,
                                                  fontSize: 16,
                                                ))),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color:
                                                bluecolor,

                                            // green as background color
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                  SizedBox(
                  width: 10,
                ),


                  ],
                ),

               ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
               
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: buttoncolor,
                ),
                child: Text('MENU'),
              ),
            ),
            // ListTile(
            //   title: const Text('Dashboard'),
            //   leading: Icon(
            //     Icons.home,
            //   ),
            //   iconColor: Colors.black,
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => dashboardpage(),
            //     ),
            //   ),
            // ),
            ListTile(
              title: const Text('Edit Profile'),
              leading: Icon(Icons.edit),
              iconColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editprofile(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Company Profile'),
              leading: Icon(Icons.contacts),
              iconColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => companyprofile(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Post job'),
              leading: Icon(Icons.computer),
              iconColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => postjob(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Manage Jobs'),
              leading: Icon(Icons.groups_outlined),
              iconColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => managejob(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Manage Message'),
              leading: Icon(Icons.mail),
              iconColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => managemessages(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Manage Followers'),
              iconColor: Colors.black,
              leading: Icon(Icons.dashboard_customize_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => managefollowers(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              iconColor: Colors.black,
              leading: Icon(Icons.logout_outlined),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => adminlogin(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee(01, 'Silver Plan', '20-09-22', '12-10-22', '4/10'),
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
      this.id, this.name, this.PurchaseDate, this.ExpireDate, this.AvaildQuata);

  /// Name of an employee.
  final String name;

  /// Id of an employee.
  final int id;

  /// Designation of an employee.
  final String PurchaseDate;

  /// Salary of an employee.
  final String ExpireDate;

  final String AvaildQuata;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'User ID', value: e.name),
              DataGridCell<int>(columnName: 'Plan Name', value: e.id),
              DataGridCell<String>(
                  columnName: 'Purchase Date', value: e.PurchaseDate),
              DataGridCell<String>(
                  columnName: 'Expire Date', value: e.ExpireDate),
              DataGridCell<String>(
                  columnName: 'Avalid Quata', value: e.AvaildQuata),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
