import 'package:flutter/material.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/manage_messages.dart';
import 'package:nav2/post_job.dart';

class companyprofile extends StatefulWidget {
  const companyprofile({Key? key}) : super(key: key);

  @override
  State<companyprofile> createState() => _companyprofileState();
}

class _companyprofileState extends State<companyprofile> {
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                child: Card(
                  elevation: 10,
                    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),),
                  child: Center(
                    child: Container(
                      width: 380,
                      height: 1100,
                    
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Image.asset('assets/job6.jpeg'),
                                  width: 300,
                                  height: 200,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    'Conway c',
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.timer),
                                      Text(
                                        'Member Since, Aug 30, 2022',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        'Chennai',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => postjob(),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20, top: 10),
                                      child: Container(
                                          width: 350,
                                          height: 50,
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: Color.fromARGB(
                                                    255, 26, 181, 195),
                                              ),
                                              Text("  Add to Favourite ",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          )),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  30), // radius of 10
                                              color: Color.fromARGB(
                                                  255, 254, 254, 254),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 26, 181, 195),
                                                  width: 2)
                                              // green as background color
                                              )),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => postjob(),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: Container(
                                          width: 350,
                                          height: 50,
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.mail,
                                                color: Color.fromARGB(
                                                    255, 26, 181, 195),
                                              ),
                                              Text("  Send Messsage ",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          )),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  30), // radius of 10
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 26, 181, 195),
                                                  width: 2)
                                              // green as background color
                                              )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.call),
                                      Text(
                                        '  638856435',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail),
                                      Text(
                                        '  yuvarani.bhive@gmail.com',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.http),
                                      Text(
                                        '  http://',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 30),
                                      child: Text(
                                        'Company Detail',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, bottom: 5),
                                      child: Text(
                                        'Is Email Verified',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, bottom: 20),
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Container(
                                    width: 350,
                                    height: 70,
                                    color: Color.fromARGB(255, 228, 228, 226),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text('Total Employees',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        )),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, bottom: 5, top: 20),
                                      child: Text(
                                        'Establishes In',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, bottom: 20),
                                      child: Text(
                                        '2020',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                                Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Container(
                                    width: 350,
                                    height: 70,
                                   color: Color.fromARGB(255, 228, 228, 226),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Text('Current jobs',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400)),
                                              ),
                                              Text('6',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w700)),
                                            ],
                                          ),
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
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),),
                  child: Center(
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20),
                            child: Text('About Company' ,style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 20),
                            child: Text('testing',style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
                      
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 30),
                child: Text('Job openings',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
              ),

               SizedBox(
                        height: 390,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget> [
                             SizedBox(
                        width: 10,
                      ),
                     


                            Card(
                              elevation: 3,
                        shape: RoundedRectangleBorder(
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                         side: BorderSide(
      color: Color.fromARGB(255, 174, 174, 176), ),
                            borderRadius: BorderRadius.circular(20)),
                              child: Container(
                        width: 320,
                        height: 360,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                               padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40,bottom: 10),
                                      child: Container(
                                       
                                        height: 80,
                                        width: 80,
                                        child: Image.asset('assets/job7.jpeg')),
                                    ),
                                     
                                  ],
                                ),
                              ),
                              
                           
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15,right: 10),
                                     child: Container(
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                        child: Text('Contract',style: TextStyle(color: Colors.white),),
                                      ),
                                      
                                  ),
                                   ),
                                   Container(
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 241, 15, 15),borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                                      child: Text('First Shift (Day)',style: TextStyle(color: Colors.white),),
                                    ),
                                    
                                  ),
                                ],
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 20,right: 90,top: 20,bottom: 0),
                                child: Text('Conway c',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                              ),
                           
                              Padding(
                               padding: const EdgeInsets.only(left: 18,top: 5,bottom: 5),
                                child: Text('Java Script',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              ),
                              Padding(
                               padding: const EdgeInsets.only(left: 15,top: 5,bottom: 4),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                     Text(' Anar Darreh',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                              ),
                              InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("View Detail",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                               
                                                // green as background color
                                                )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => dashboardpage(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 5, top: 10),
                                        child: Container(
                                            width: 300,
                                            height: 40,
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                
                                                Text("Save Job",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 181, 195),
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), // radius of 10
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 26, 181, 195),
                                                    width: 2)
                                                // green as background color
                                                )),
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
                      SizedBox(
                        height: 40,
                      )
            ],
          ),
        ),
      ),
      //  drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         child: const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Color.fromARGB(255, 151, 239, 249),
      //           ),
      //           child: Text('MENU'),
      //         ),
      //       ),
      //       // ListTile(
      //       //   title: const Text('Dashboard'),
      //       //   leading: Icon(
      //       //     Icons.home,
      //       //   ),
      //       //   iconColor: Colors.black,
      //       //   onTap: () => Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //       builder: (context) => dashboardpage(),
      //       //     ),
      //       //   ),
      //       // ),
      //       ListTile(
      //         title: const Text('Edit Profile'),
      //         leading: Icon(Icons.edit),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => editprofile(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Company Profile'),
      //         leading: Icon(Icons.contacts),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => companyprofile(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Post job'),
      //         leading: Icon(Icons.computer),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => postjob(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Jobs'),
      //         leading: Icon(Icons.groups_outlined),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managejob(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Message'),
      //         leading: Icon(Icons.mail),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managemessages(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Followers'),
      //         iconColor: Colors.black,
      //         leading: Icon(Icons.dashboard_customize_rounded),
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managefollowers(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Logout'),
      //         iconColor: Colors.black,
      //         leading: Icon(Icons.logout_outlined),
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => postjob(),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
