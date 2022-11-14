import 'package:flutter/material.dart';

import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/edit_profile.dart';

import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/post_a_newjob.dart';

import '../utils/constants.dart';

const activecolor = Colors.green;

class postjob extends StatefulWidget {
  const postjob({Key? key}) : super(key: key);

  @override
  State<postjob> createState() => _postjobState();
}

class _postjobState extends State<postjob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(width: 80, child: Image.asset(APP_LOGO)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Find your Posted jobs here",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => post_a_newjob(),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 20, top: 10, bottom: 10),
                          child: Container(
                              width: 100,
                              height: 35,
                              child: Center(
                                  child: Text("Add New Post",
                                      style: TextStyle(
                                          color: whitecolor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))),
                              decoration: BoxDecoration(
                                color: buttoncolor,
                                borderRadius:
                                    BorderRadius.circular(10), // radius of 10

                                // green as background color
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Card(
                          elevation: 1,
                          child: Center(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/job1.jpeg',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 135),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                'Node js',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  actions: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              Padding(
                                                                padding:
                                                                     EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                    Icons.edit),
                                                              ),
                                                              Text("edit ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25,
                                                                    bottom: 20),
                                                            child: Row(
                                                              children: const [
                                                                Padding(
                                                                  padding:  EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          10),
                                                                  child: Icon(Icons
                                                                      .delete),
                                                                ),
                                                                Text("delete",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25),
                                            child: Icon(
                                              Icons.more_horiz,
                                              size: 35,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: greycolor),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                  'Full Time/ Permanent',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      left: 5),
                                                              child: Text(
                                                                "20-09-22",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: 14,
                                                                )),
                                                            Text(
                                                              " Chennai",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 10),
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Active Post",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: activecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Card(
                          elevation: 1,
                          child: Center(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/job7.jpeg',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 159),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                'Java',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Column(
                                                    children: [
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 10),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/shortlist-icon.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 30),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/candidates.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                    Icons.edit),
                                                              ),
                                                              Text("edit ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25,
                                                                    bottom: 20),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          10),
                                                                  child: Icon(Icons
                                                                      .delete),
                                                                ),
                                                                Text("delete",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25),
                                            child: Icon(
                                              Icons.more_horiz,
                                              size: 35,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: greycolor),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text('Contract',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      left: 5),
                                                              child: Text(
                                                                "20-09-22",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: 14,
                                                                )),
                                                            Text(
                                                              " Chennai",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 10),
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Active Post",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: activecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Card(
                          elevation: 1,
                          child: Center(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/job6.jpeg',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 130),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                'React js',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Column(
                                                    children: [
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 10),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/shortlist-icon.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 30),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/candidates.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                    Icons.edit),
                                                              ),
                                                              Text("edit ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25,
                                                                    bottom: 20),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          10),
                                                                  child: Icon(Icons
                                                                      .delete),
                                                                ),
                                                                Text("delete",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25),
                                            child: Icon(
                                              Icons.more_horiz,
                                              size: 35,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: greycolor),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Full Time/ Permanent',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      left: 5),
                                                              child: Text(
                                                                "20-09-22",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: 14,
                                                                )),
                                                            Text(
                                                              " Chennai",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 10),
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Active Post",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: activecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Card(
                          elevation: 1,
                          child: Center(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/job1.jpeg',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 146),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                'Flutter',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: Column(
                                                    children: [
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 10),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/shortlist-icon.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(top: 30),
                                                      //   child: Row(
                                                      //       children: [
                                                      //         Image.asset(
                                                      //           'assets/candidates.png',
                                                      //           width: 30,
                                                      //           height: 30,
                                                      //         ),
                                                      //           Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      //       ],

                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                    Icons.edit),
                                                              ),
                                                              Text("edit ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25,
                                                                    bottom: 20),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          10),
                                                                  child: Icon(Icons
                                                                      .delete),
                                                                ),
                                                                Text("delete",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 25),
                                            child: Icon(
                                              Icons.more_horiz,
                                              size: 35,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: greycolor),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Full Time/ Permanent',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      left: 5),
                                                              child: Text(
                                                                "20-09-22",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: 14,
                                                                )),
                                                            Text(
                                                              " Chennai",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 30,
                                                                left: 10),
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Active Post",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: activecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
