import 'package:flutter/material.dart';
import 'package:nav2/managemessages/manage_messages_receiv.dart';


import '../utils/constants.dart';

class managemessages extends StatefulWidget {
  const managemessages({Key? key}) : super(key: key);

  @override
  State<managemessages> createState() => _managemessagesState();
}

class _managemessagesState extends State<managemessages> {
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
      body: Container(
         
                
                
                    child: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 175,
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
                                              padding: const EdgeInsets.only(right: 123),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 0),
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
                              color: Color.fromARGB(255, 0, 0, 0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, top: 0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 110),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 0),
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
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
        
        
    );

  }
}
