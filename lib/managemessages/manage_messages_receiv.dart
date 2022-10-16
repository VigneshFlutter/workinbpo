import 'package:flutter/material.dart';

import '../utils/constants.dart';


class managemessagereceive extends StatefulWidget {
  const managemessagereceive({Key? key}) : super(key: key);

  @override
  State<managemessagereceive> createState() => _managemessagereceiveState();
}

class _managemessagereceiveState extends State<managemessagereceive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                
                child: Icon(Icons.notifications)),
          )
        ],
        title: Center(
            child: Container(
                width: 80, child: Image.asset(APP_LOGO))),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Card(
              child: Container(
                height: 70,
                width: double.infinity,
         
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                       
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                             
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
                                              bottom: 5, top: 0,left: 10),
                                          child: Row(
                                         
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 170),
                                                child: Text(
                                                  'Subasini',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                              //  Text(
                                              //   '8.15.pm',
                                              //   style: TextStyle(
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w300),
                                              // ),
                                            ],
                                          ),
                                        ),
                                       
                                       
                                      ],
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
                    height: 20,
                  ),
                   Padding(
                  
                              padding: const EdgeInsets.only(left: 10,right: 0),
                     child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topRight: Radius.circular(10),)),
                              
                                child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       children: [
                                       
                                            Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 0,right: 10),
                                                 child: Text(
                                                                'Conway has been sent call for interview',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w500)),
                                               ),
                                                                   Padding(
                                                              padding: const EdgeInsets.only(),
                                                             
                                                               
                                                                child: Text(
                                                        '8.15 am',
                                                        style: TextStyle(
                                                                fontWeight: FontWeight.w300)),
                                                                   ),
                                                              
                                                            
                                             ],
                                           
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
                  
                              padding: const EdgeInsets.only(left: 10,right: 0),
                     child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topRight: Radius.circular(10),)),
                              
                                child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       children: [
                                       
                                            Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 0,right: 10),
                                                 child: Text(
                                                                'Conway has been sent call for interview',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w500)),
                                               ),
                                                                   Padding(
                                                              padding: const EdgeInsets.only(),
                                                             
                                                               
                                                                child: Text(
                                                        '2.15 pm',
                                                        style: TextStyle(
                                                                fontWeight: FontWeight.w300)),
                                                                   ),
                                                              
                                                            
                                             ],
                                           
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
                       
                
                       

            ],
          ),
        ),
      ),
    );
  }
}

class managemessagereceive2 extends StatefulWidget {
  const managemessagereceive2({Key? key}) : super(key: key);

  @override
  State<managemessagereceive2> createState() => _managemessagereceive2State();
}

class _managemessagereceive2State extends State<managemessagereceive2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Container(
          width: 80,
          child: Image.asset(APP_LOGO)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
            iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
       child: Container(
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Card(
              child: Container(
                height: 70,
                width: double.infinity,
         
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                       
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                             
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
                                              bottom: 5, top: 0,left: 10),
                                          child: Row(
                                         
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 170),
                                                child: Text(
                                                  'Ganeshan',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                              //  Text(
                                              //   '8.15.pm',
                                              //   style: TextStyle(
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w300),
                                              // ),
                                            ],
                                          ),
                                        ),
                                       
                                       
                                      ],
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
                    height: 20,
                  ),
                   Padding(
                  
                              padding: const EdgeInsets.only(left: 10,right: 0),
                     child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topRight: Radius.circular(10),)),
                              
                                child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       children: [
                                       
                                            Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 0,right: 10),
                                                 child: Text(
                                                                'Conway has been sent call for interview',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w500)),
                                               ),
                                                                   Padding(
                                                              padding: const EdgeInsets.only(),
                                                             
                                                               
                                                                child: Text(
                                                        '8.15 am',
                                                        style: TextStyle(
                                                                fontWeight: FontWeight.w300,fontSize: 12)),
                                                                   ),
                                                              
                                                            
                                             ],
                                           
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
                  
                              padding: const EdgeInsets.only(left: 10,right: 0),
                     child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topRight: Radius.circular(10),)),
                              
                                child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       children: [
                                       
                                            Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 0,right: 10),
                                                 child: Text(
                                                                'Conway has been sent call for interview',
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w600),),
                                               ),
                                                                   Padding(
                                                              padding: const EdgeInsets.only(),
                                                             
                                                               
                                                                child: Text(
                                                        '2.15 pm',
                                                        style: TextStyle(
                                                                fontWeight: FontWeight.w300,fontSize: 12)),
                                                                   ),
                                                              
                                                            
                                             ],
                                           
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
                       
                
                       

            ],
          ),
        ),
      ),
    );
    
  }
}