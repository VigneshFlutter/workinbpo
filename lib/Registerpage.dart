import 'package:flutter/material.dart';
import 'package:nav2/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
        body: Container(
      child: ListView(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(
                     top: 20, bottom: 10),
            child: Text('Create a Employer account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  width: 35,
                  height: 35,
                  child: Center(child: Text('1',style:TextStyle(color: Colors.white) ,)),
                  decoration: BoxDecoration(
                   color: Color.fromARGB(255, 26, 181, 195),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Text('PERSONAL INFORMATION',style: TextStyle(fontWeight: FontWeight.w500),)
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
             enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'First Name',
              
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Last Name',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Contact Number',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Email',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Password',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Password Confimation',
            )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  width: 35,
                  height: 35,
                  child: Center(child: Text('2',style:TextStyle(color: Colors.white) )),
                  decoration: BoxDecoration(
                   color: Color.fromARGB(255, 26, 181, 195),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Text("COMPANY'S INFORMATION",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Name',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "Company's Location",
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Contact Number',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Email ID',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Number Of Offices',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Established In',
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Description',
            )),
          ),
           
          Padding(
            padding:
           const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
children: [
Checkbox(
value: _checkbox,
onChanged: (value) {
setState(() {
_checkbox = !_checkbox;
});
},
),
Text('I accept Terms of Use'),
],
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                  child: Text("Signup",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16,
                                      ))),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(10), // radius of 10
                                color: Color.fromARGB(255, 33, 196, 211),
                                // green as background color
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,top:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? '),
                           Text('Log-in ',style: TextStyle(color: Color.fromARGB(255, 33, 196, 211),),),

                        ],
                      ),
                    ),
            
        ],
      ),
    ));
  }
}
