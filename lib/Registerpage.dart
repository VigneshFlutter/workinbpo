
import 'package:flutter/material.dart';
import 'package:nav2/utils/custom_snackbar.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkbox = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView(
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
                        color: const Color.fromARGB(255, 26, 181, 195),
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
                        color: const Color.fromARGB(255, 26, 181, 195),
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
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Name',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Company's Location",
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
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
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email ID',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Number Of Offices',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Established In',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // radius of 10
                      color: const Color.fromARGB(255, 33, 196, 211),
                      // green as background color
                    ),
                    child: const Center(
                        child: Text("Signup",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                            )))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Already have an account? '),
                    Text(
                      'Log-in ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 33, 196, 211),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void checkingValues() {
    if(firstNameTextEd.text.isEmpty){
      errorSnackBar('Please enter your first name', context);
    }else{
      if(lastNameTextEd.text.isEmpty){
        errorSnackBar('Please enter your last name', context);
      }else{
        if(contactTextEd.text.isEmpty){
          errorSnackBar('Please enter contact number', context);
        }else{
          if(emailTextEd.text.isEmpty){
            errorSnackBar('Please enter your email address', context);
          }else{
            if(passwordTextEd.text.isEmpty){
              errorSnackBar('Please enter your password', context);
            }else{
              if(passwordConfirmationTxtEd.text.isEmpty){
                errorSnackBar('Please enter your confirm password', context);
              }else{
                if(nameTextEd.text.isEmpty){
                  errorSnackBar('Please enter your company name', context);
                }else{

                }
              }
            }
          }
        }
      }
    }
  }
}
