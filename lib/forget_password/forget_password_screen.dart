import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  double? height ;
  double? width;
  TextEditingController emailTextEd = TextEditingController();
  bool isPressed = false ;

  Future<void> forgetPasswordApi() async {

    var url = Uri.parse(FORGET_PASSWORD_API);
    http.Response response = await http.post(url ,
    body: {
      'email': emailTextEd.text
    });
    print('The Response of forget password ${response.body}');

    // ignore: use_build_context_synchronously
    successSnackBar('Successfully sent!', context);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(height: 30,) ,

            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: ()=> Navigator.pop(context),
              ),
            ) ,

            const SizedBox(height: 10,) ,

            const Text('Forget Password' , style: TextStyle(
              fontSize: 21 ,
              fontWeight: FontWeight.w600
            ),) ,

            SizedBox(height: 20,) ,

            const Text('Email Address ' , style: TextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.w500
            ),) ,

            const SizedBox(height: 10,) ,

            TextFormField(
              controller: emailTextEd,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                hintText: 'Enter email address'
              ),
            ) ,

            const SizedBox(height: 30,) ,

            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: (){
                  if(emailTextEd.text.isNotEmpty){
                    setState(() {
                      isPressed = true ;
                    });
                    forgetPasswordApi();
                  }else{
                    errorSnackBar('Please type email address', context);
                  }
                },
                child: Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                    color: APPCOLOR ,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child:  Center(
                    child: isPressed ? Lottie.asset(APP_LOADING,
                        height: 35, width: 55)
                        : const Text('Submit' ,
                    style: TextStyle(
                      fontWeight: FontWeight.w500 ,
                      color: Colors.white,
                      fontSize: 15
                    ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
