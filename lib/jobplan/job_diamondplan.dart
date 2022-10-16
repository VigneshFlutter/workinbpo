
import 'package:flutter/material.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/jobplan/job_goldplan.dart';
import 'package:nav2/managemessages/manage_messages.dart';

import '../utils/constants.dart';

class jobplandiamond extends StatefulWidget {
  const jobplandiamond({Key? key}) : super(key: key);

  @override
  State<jobplandiamond> createState() => _jobplandiamondState();
}

class _jobplandiamondState extends State<jobplandiamond> {
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
        child: Center(
          child: Container(
            child: ListView(
              children: [


                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
                    child: Container(
                      
                     
                      height: 1150,
   
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text('Stripe',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800,color: stripecolor),),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text('Invoice Details',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Row(
                              children: [
                                Text('Package :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color.fromARGB(255, 0, 0, 0)),),
                                Text(' Diamond Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: plancolor),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),

                           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Row(
                              children: [
                                Text('Price :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color.fromARGB(255, 0, 0, 0)),),
                                Text(' ₹5000',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: plancolor),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Row(
                              children: [
                                Text('Can post jobs :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color.fromARGB(255, 0, 0, 0)),),
                                Text(' 50',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: plancolor),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Row(
                              children: [
                                Text('Package Duration :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color.fromARGB(255, 0, 0, 0)),),
                                Text(' 50 Days',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: plancolor),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ), Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text('Strip - Credit Card Details',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text('Name on Credit Card',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Name on Credit Card',
            )),
          ),

          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 0),
                            child: Text('Credit Card Number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Credit Card Number',
            )),
          ),

           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 0),
                            child: Text('Credit Card Expiry Month',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: '01',
            )),
          ),
           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 0),
                            child: Text('Credit Card Expiry Year',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: '2022',
            )),
          ),
           Padding(
                            padding: const EdgeInsets.only(left: 20,top: 0),
                            child: Text('CVV Number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)),),
                          ),
                          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'CVV Number',
            )),
          ),
           InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => adminlogin(),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 20),
                                    child: Container(
                                        width: 200,
                                        height: 55,
                                        child: Center(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 30),
                                                  child: Text("Pay With Stripe ",
                                                      style: TextStyle(
                                                        color: whitecolor,
                                                        fontSize: 18,
                                                      )),
                                                ),
                                                    Icon(Icons.arrow_forward)
                                              ],
                                            )),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          // radius of 10
                                          color: buttoncolor
                                          // green as background color
                                        )),
                                  ),
                                ),
                              ),


                         

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}