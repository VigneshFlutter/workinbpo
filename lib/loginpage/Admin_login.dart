import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/Registerpage.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/model/login_model.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/saving_token.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http ;

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key}) : super(key: key);

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {

  bool isVisible = false ;
  bool isPressed = false ;
  //TextEditing
  TextEditingController emailTextEd = TextEditingController();
  TextEditingController passwordTextEd = TextEditingController();

  Future<void> loginApi() async {
    var url = Uri.parse('${BASE_URL}login');
    http.Response response = await http.post(url ,
    body: {
      'email' : emailTextEd.text ,
      'password': passwordTextEd.text
    });
    print('The Response of login ${response.body}');
    LoginModel data = LoginModel.fromJson(jsonDecode(response.body));

    if(response.statusCode == 200){
      setState(() {
        isPressed = false ; 
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => bottom_navigation()));
      savingToken(data.accessToken!);
    }else{
      setState(() {
        isPressed  = false ;
      });
      errorSnackBar('Please check your email and password', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
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
                      height: 520,
                      width: 360,
                      child: Column(
                        children: [
                          Image.asset(APP_LOGO , height: 95 , width: 250,) ,
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 30, bottom: 20),
                            child: TextField(
                              controller: emailTextEd,
                                decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Email Address',
                            )),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 20, right: 20, top: 10, bottom: 20),
                          //   child: Container(
                          //     height: 55,
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 8.0
                          //     ),
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white ,
                          //       borderRadius: BorderRadius.circular(8),
                          //       border: Border.all(
                          //         color: Colors.white
                          //       )
                          //     ),
                          //
                          //   )
                          // ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                      controller: passwordTextEd,
                                      obscureText: isVisible,

                                      decoration:  InputDecoration(
                                        suffix: isVisible  ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisible = false ;
                                              });
                                            },
                                            child: const Icon(Icons.visibility)) :
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                isVisible = true ;
                                              });
                                            },
                                            child: const Icon(Icons.visibility_off)) ,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        labelText: 'Enter Password',)),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isPressed = true ;
                              });
                              loginApi();
                            },
                            child: Container(
                                width: 350,
                                height: 50,
                                margin: const EdgeInsets.only(left: 30, right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10), // radius of 10
                                  color: APPCOLOR,
                                  // green as background color
                                ),
                                child:  Center(
                                    child: isPressed ? Lottie.asset(APP_LOADING , height: 35 , width: 55):
                                    const Text("Log In ",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 18,
                                        )))),),


                          const Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:  EdgeInsets.only(
                                    bottom: 20, right: 20, top: 30),
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: APPCOLOR),
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
                                      color: APPCOLOR,
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
                const SizedBox(
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
