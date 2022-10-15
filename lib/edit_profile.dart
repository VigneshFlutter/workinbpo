import 'package:flutter/material.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/loginpage/login_page.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/post_job.dart';




class editprofile extends StatefulWidget {
  const editprofile({Key? key}) : super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Container(
          width: 80,
          child: Image.asset('assets/work in bpo.png')),
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
                  child: Center(
                    child: Container(
                      
                      width: 380,
                      height: 300,
                     
                      child: Column(
                        children: [

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 30,bottom: 10),
                              child: Text('Account Information',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                            )),


                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
                          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email Address',
            )),
          ),
           Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: TextField(
                    decoration: InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Enter Password',
                  suffixIcon: Icon(Icons.visibility,color: Colors.black,)
            )),
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Card(
                    elevation: 10,
                    child: Container(
                     
                      width: 380,
                      height: 2500,
                     
                      child: Column(
                        children: [

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 30,bottom: 10),
                              child: Text('Company Information',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                            )),
                            Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                              child: Text('Company logo',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset('assets/job6.jpeg')),
                              ),
                            ),

                            InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Container(
                                    width: 350,
                                    height: 50,
                                    child: Center(
                                        child: Text(" Select Company Logo ",
                                            style: TextStyle(
                                              color:
                                               whitecolor,
                                              fontSize: 18,
                                            ))),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10), // radius of 10
                                      color: buttoncolor,
                                      // green as background color
                                    )),
                              ),
                            ),
                          ),




                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Text('Company Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
                          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Conway c',
            )),
          ),
           Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('CEO Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Company CEO',
              
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Industry',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Select Industry',
             
            )),
          ),
           Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Owership',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Select Ownership type',
             
            )),
          ),
           Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Description',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Description',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Chennai',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('No of Office',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: '2',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('No of Employees',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'select num. of employees',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Established In',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: '2020',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Website URL',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'http://',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Fax',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Fax',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Phone',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: '63888776548',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Facebook',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Facebook',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Twitter',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Twitter',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('LinkedIn',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Linkedin',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Google Plus',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Google+',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Pinterest',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Pinterest',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Country',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Select Country',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('State',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Select State',
             
            )),
          ),
          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('City',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            )),
          Padding(
            padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: TextField(
                    decoration: InputDecoration(
              enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Select City',
             
            )),
          ),
           InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    child: Center(
                                        child: Text("Update Profile And Save",
                                            style: TextStyle(
                                              color:
                                                  whitecolor,
                                              fontSize: 16,fontWeight: FontWeight.w600
                                            ))),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10), // radius of 10
                                      color: buttoncolor,
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
              ),

              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      

    );
    
  }
}