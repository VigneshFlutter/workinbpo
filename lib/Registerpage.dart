import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/model/register_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:nav2/utils/saving_token.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkbox = false;
  bool isPressed = false;

  //Text Editing Controller
  TextEditingController firstNameTextEd = TextEditingController();
  TextEditingController lastNameTextEd = TextEditingController();
  TextEditingController contactTextEd = TextEditingController();
  TextEditingController emailTextEd = TextEditingController();
  TextEditingController passwordTextEd = TextEditingController();
  TextEditingController passwordConfirmationTxtEd = TextEditingController();

  TextEditingController nameTextEd = TextEditingController();
  TextEditingController companyLocationTextEd = TextEditingController();
  TextEditingController contactNumTextEd = TextEditingController();
  TextEditingController emailIDTextEd = TextEditingController();
  TextEditingController numberofOfficiesTextEd = TextEditingController();
  TextEditingController establishedINTextEd = TextEditingController();
  TextEditingController descriptionTextEd = TextEditingController();

  Future<void> registerAPi() async {
    String REG_URL = BASE_URL + 'register';
    var url = Uri.parse(REG_URL);
    http.Response response = await http.post(url ,
    body: {
      'candidate_or_employer': 'employer' ,
      'firstname': firstNameTextEd.text ,
      'lastname': lastNameTextEd.text ,
      'contact': '+91 ${contactTextEd.text}' ,
      'email': emailTextEd.text ,
      'password': passwordTextEd.text ,
      'password_confirmation': passwordConfirmationTxtEd.text ,
      'name': nameTextEd.text ,
      'location': companyLocationTextEd.text ,
      'phone': '+91 ${contactNumTextEd.text}' ,
      'companyemail': emailIDTextEd.text ,
      'no_of_offices': numberofOfficiesTextEd.text ,
      'established_in': establishedINTextEd.text ,
      'description': descriptionTextEd.text ,
      'is_subscribed': '1' ,
      'terms_of_use': '1'
    });
    print('The Response of register api ${response.body}');
    RegisterModel data = RegisterModel.fromJson(jsonDecode(response.body));

    if(data.status!){
      savingToken(data.token!);

      //ignore: use_build_context_synchronously
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const bottom_navigation()));
    }else{
      errorSnackBar('Not registered yet', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'Create a Employer account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: APPCOLOR,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                        child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const Text(
                  'PERSONAL INFORMATION',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  controller: firstNameTextEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'First Name',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  controller: lastNameTextEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Last Name',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: contactTextEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Contact Number',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  controller: emailTextEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  controller: passwordTextEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                  controller: passwordConfirmationTxtEd,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                    decoration: BoxDecoration(
                      color: APPCOLOR,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                        child:
                            Text('2', style: TextStyle(color: Colors.white))),
                  ),
                ),
                const Text(
                  "COMPANY'S INFORMATION",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: nameTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Name',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: companyLocationTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Company's Location",
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: contactNumTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Contact Number',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailIDTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Email ID',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number ,
                controller: numberofOfficiesTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Number Of Offices',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: establishedINTextEd,
                  decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Established In',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                 controller: descriptionTextEd,
                  maxLines: 3,
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Description',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: APPCOLOR,
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  const Text('I accept Terms of Use'),
                ],
              ),
            ),
            InkWell(
              onTap: () => checkingValues(),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // radius of 10
                    color: APPCOLOR,
                    // green as background color
                  ),
                  child:  Center(
                      child: isPressed ? Lottie.asset(APP_LOADING , height: 35 , width: 55) :
                      const Text("Signup",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          )))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Already have an account? '),
                  InkWell(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const adminlogin())),
                    child: const Center(
                      child: Text(
                        'Log-in ',
                        style: TextStyle(
                          color: APPCOLOR,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void checkingValues() {
    if (firstNameTextEd.text.isEmpty) {
      errorSnackBar('Please enter your first name', context);
    } else {
      if (lastNameTextEd.text.isEmpty) {
        errorSnackBar('Please enter your last name', context);
      } else {
        if (contactTextEd.text.isEmpty) {
          errorSnackBar('Please enter contact number', context);
        } else {
          if (emailTextEd.text.isEmpty) {
            errorSnackBar('Please enter your email address', context);
          } else {
            if (passwordTextEd.text.isEmpty) {
              errorSnackBar('Please enter your password', context);
            } else {
              if (passwordConfirmationTxtEd.text.isEmpty) {
                errorSnackBar('Please enter your confirm password', context);
              } else {
                if (nameTextEd.text.isEmpty) {
                  errorSnackBar('Please enter your company name', context);
                } else {
                  if (companyLocationTextEd.text.isEmpty) {
                    errorSnackBar(
                        'Please enter your company location', context);
                  } else {
                    if (contactNumTextEd.text.isEmpty) {
                      errorSnackBar(
                          'Please enter your company contact number', context);
                    } else {
                      if (emailIDTextEd.text.isEmpty) {
                        errorSnackBar(
                            'Please enter your company email', context);
                      } else {
                        if (numberofOfficiesTextEd.text.isEmpty) {
                          errorSnackBar(
                              'Please enter your number of officies count',
                              context);
                        } else {
                          if (establishedINTextEd.text.isEmpty) {
                            errorSnackBar(
                                'Please enter your established in year',
                                context);
                          } else {
                            if (descriptionTextEd.text.isEmpty) {
                              errorSnackBar(
                                  'Please enter your description', context);
                            } else {
                              if (_checkbox) {
                                registerAPi();
                                setState(() {
                                  isPressed = true ;
                                });
                              } else {
                                errorSnackBar(
                                    'Please accept our terms of use', context);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
