import 'package:flutter/material.dart';
import 'package:nav2/Registerpage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          
         
          child: ListView(
            
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset('assets/work in bpo.png')),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Job Recruiter',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Login to continue',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  )),
                 
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Enter email ID',
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Enter password',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () => setState(() {})),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 26, 181, 195),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      ),
                      child: Center(
                        child: Container(
                            width: 100,
                            height: 40,
                            child: Center(
                                child: Text("Log in",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                    ))),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20), // radius of 10
                              color: Color.fromARGB(255, 26, 181, 195),
                              // green as background color
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Are you new user? ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                        )),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 181, 195),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
             
             
           
            ],
          ),
        ),
      ),
    );
  }
}


