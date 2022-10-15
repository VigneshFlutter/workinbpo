import 'package:flutter/material.dart';

import 'managemessages/manage_messages.dart';

        class openjob extends StatefulWidget {
  const openjob({Key? key}) : super(key: key);

  @override
  State<openjob> createState() => _openjobState();
}

class _openjobState extends State<openjob> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 20),
                child: Text('Job Openings ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
                                      // onTap: () => Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => dashboardpage(),
                                      //   ),
                                      // ),
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
      ),);
  }
}
            
          
        
      
    
    


        
        
       