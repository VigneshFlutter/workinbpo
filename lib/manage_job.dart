import 'package:flutter/material.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile1.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile2.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile3.dart';
import 'package:nav2/shortlistedprofile/shortlistedprofile4.dart';

class managejob extends StatefulWidget {
  const managejob({Key? key}) : super(key: key);

  @override
  State<managejob> createState() => _managejobState();
}

class _managejobState extends State<managejob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Container(width: 80, child: Image.asset('assets/work in bpo.png')),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 15),
                  child: Text('Company Posted Jobs',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                ),
                Padding(
                 padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                      'assets/conwayimage.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 105),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                          child: Text(
                                            'Java Script',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                       Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5,right: 28),
                                        child: Text(
                                          'Canway c',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'First Shift(Day) - Amli',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: InkWell(
                                                     onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted1(),
                                ),
                              ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                         Text(
                                                    " 1",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                ),
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                             onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted1(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 1",
                                                  style: TextStyle(fontSize: 20),
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
                 Padding(
                  padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                      'assets/conwayimage.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 137),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Nodejs',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text('Conway c',
                                          style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'First Shift(Day) - Durres',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/shortlist-icon.png',
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                       Text(
                                                  " 0",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                    
                                                    ],
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted2(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 2",
                                                  style: TextStyle(fontSize: 20),
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

                 Padding(
                 padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                      'assets/conwayimage.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 137),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5,right: 30),
                                        child: Text(
                                          'Css',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text('Conway c',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Third Shift(Night) - ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: InkWell(
                                                    onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted1(),
                                ),
                              ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                         Text(
                                                    " 1",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                ),
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted4(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 4",
                                                  style: TextStyle(fontSize: 20),
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

                 Padding(
                  padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                      'assets/conwayimage.jpeg',
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
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Flutter',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text('Conway',
                                          style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Second Shift(Afternoon) - ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: InkWell(
                                                    onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted1(),
                                ),
                              ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                         Text(
                                                    " 1",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                ),
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted3(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 3",
                                                  style: TextStyle(fontSize: 20),
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

                 Padding(
                  padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                      'assets/conwayimage.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 132),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'React js',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Text('Conway c',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'First Shift(Day) - ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/shortlist-icon.png',
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                       Text(
                                                  " 0",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                    
                                                    ],
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted2(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 2",
                                                  style: TextStyle(fontSize: 20),
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

                 Padding(
               padding: const EdgeInsets.only(left:5,right: 5,bottom: 5),
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
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/conwayimage.jpeg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 74),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Java Developer',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 60),
                                        child: Text('Conway c',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Column(
                                              children: [
                                           
                                                  
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List of shortlist candidate',style: TextStyle(fontSize: 18),)
                                                      ],
                                                    
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 30),
                                                  child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/candidates.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                          Text('  List candidate',style: TextStyle(fontSize: 18))
                                                      ],
                                                    
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Column(
                                                   crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                          .edit),
                                                        ),
                                                                    Text(
                                                                        "edit ",
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
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
                                                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                                          child: Icon(Icons
                                                                            .delete),
                                                        ),
                                                                      Text(
                                                                          "delete",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
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
                                      left: 10, bottom: 5),
                                  child: Text(
                                      'Rotating - ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: InkWell(
                                                    onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted2(),
                                ),
                              ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/shortlist-icon.png',
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                         Text(
                                                    " 2",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                ),
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => shortlisted4(),
                                ),
                              ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 0),
                                                  child: Image.asset(
                                                    'assets/candidates.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Text(
                                                  " 4",
                                                  style: TextStyle(fontSize: 20),
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
        ),
      ),
    );
  }
}
