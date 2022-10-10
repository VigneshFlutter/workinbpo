import 'package:flutter/material.dart';
import 'package:nav2/checkbox.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/home.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/manage_messages.dart';

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
                height: 6,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    decoration: BoxDecoration(border:Border.all(color: Color.fromARGB(255, 152, 151, 151)),borderRadius: BorderRadius.circular(10),),
                    height: 580,
                    width: 360,
                   
                    child: Column(
                      children: [
                         SizedBox(
                  height: 30,
              ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home(),
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
                                      child: Text("Login as Job Seeker",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 255, 255, 255),
                                            fontSize: 20,fontWeight: FontWeight.bold
                                          ))),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10), // radius of 10
                                    color: Color.fromARGB(255, 26, 181, 195),
                                    // green as background color
                                  )),
                            ),
                          ),
                        ),
                         SizedBox(
                  height: 30,
              ),
                         


                         InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home(),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: Container(
                                
                                  width: 350,
                                  height: 50,
                                  child: Center(
                                      child: Text("Login as Employer",
                                          style: TextStyle(
                                            color:
                                                Colors.black,
                                            fontSize: 20,fontWeight: FontWeight.bold
                                          ))),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10), // radius of 10
                                     color: Colors.white,
                                     border: Border.all( color: Color.fromARGB(255, 26, 181, 195),width: 3)
                                    
                                    // green as background color
                                  )),
                            ),
                          ),
                        ),
                        Padding(
            padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: TextField(
                  decoration: InputDecoration(
              enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Email Address',
            )),
          ),
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
           InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home(),
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
                                      child: Text("Log In ",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 255, 255, 255),
                                            fontSize: 18,
                                          ))),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10), // radius of 10
                                    color: Color.fromARGB(255, 26, 181, 195),
                                    // green as background color
                                  )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                           padding: const EdgeInsets.only(bottom: 20,left: 20,top: 30),
                            child: Text('Forget Password?',style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 33, 196, 211)),),
                          )),
                        Padding(
                        padding: const EdgeInsets.only(bottom: 20,top:20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?  ",style: TextStyle(fontSize: 16, )),
                             Text('Create One ',style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 33, 196, 211),),),

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
              )
            ],
          ),
        ),
      ),
       endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 151, 239, 249),
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
                  builder: (context) => postjob(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
    
  }
}