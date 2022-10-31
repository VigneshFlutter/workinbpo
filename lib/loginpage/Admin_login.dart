import 'package:flutter/material.dart';
import 'package:nav2/Registerpage.dart';

import 'package:nav2/company_profile.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/post_job.dart';

import '../utils/constants.dart';

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key}) : super(key: key);

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(width: 80, child: Image.asset(APP_LOGO)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              const SizedBox(
                height: 6,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 152, 151, 151)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 580,
                    width: 360,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30, bottom: 20),
                          child: TextField(
                              decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Email Address',
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 20),
                          child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: 'Enter Password',
                                  suffixIcon: const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ))),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => managefollowers(),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                  width: 350,
                                  height: 50,
                                  child:  Center(
                                      child: Text("Log In ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 18,
                                          ))),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10), // radius of 10
                                    color: const Color.fromARGB(255, 26, 181, 195),
                                    // green as background color
                                  )),
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  bottom: 20, left: 20, top: 30),
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 33, 196, 211)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                               const Text("Don't have an account?  ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => const Register())),
                                child: const Text(
                                  'Create One ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 33, 196, 211),
                                  ),
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
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}