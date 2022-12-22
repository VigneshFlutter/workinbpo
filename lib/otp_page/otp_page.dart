import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/model/otp_model.dart';
import 'package:nav2/model/register_send_model.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../model/register_model.dart';
import '../provider/internet_provider.dart';
import '../utils/constants.dart';
import '../utils/internet_viewer.dart';

class OtpScreen extends StatefulWidget {
  String mobileNumber;
  String email;
  RegisterSendModel regData ; 
  String token ;
  OtpScreen({
    required this.mobileNumber,
    required this.email  , 
    required this.regData , 
    required this.token
    });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  double? height;
  double? width;
  String verificationCodeData = '';
  bool isLoading = false ;
  bool isSubmitedBtn = false ;
  bool isOtpVerified = true ;
  String verificationIdval = '';

  // VerifyOtpModel resData = VerifyOtpModel();
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> verifyOtp() async{
    //  FCM TOKEN
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    print('The otp fcm token $fcmToken');
    print('The Register data for otp ${widget.regData.userEmail} , ${widget.regData.userMobile} , ${otpController.text}');
    print('The Register data for otp ${widget.regData.firstName} , ${widget.regData.lastName} , ${widget.regData.password}');
    print('The Register data for otp ${widget.regData.companyName} , ${widget.regData.companyLocation} , ${widget.regData.companyPhone}');
    print('The Register data for otp ${widget.regData.companyEmail} , ${widget.regData.numberofOffices} , ${widget.regData.establishedIn}');
    print('The Register data for otp ${widget.regData.description} , ${otpController.text}');

    var dio = Dio();
    try{
      Response response = await dio.post(
          'https://knownjobz.com/api/verifyotp-twillio',
          data: {
            "email": widget.regData.userEmail ,
            "phone": widget.regData.companyPhone,
            "otp": otpController.text
          } ,
          options: Options(
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }
          )
      );

      print('The Response of Otp ${response.data}');
      OtpModel data = OtpModel.fromJson(jsonDecode(response.data));
      setState(() {
        isLoading = false ;
      });
      if(data.status!){
        // ignore: use_build_context_synchronously
        successSnackBar('Success!', context);
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const adminlogin()));
      }else{
        // ignore: use_build_context_synchronously
        errorSnackBar('Failed to verify the otp', context);
      }

    }catch(err ,stackTrace){
      debugPrint('The Verify Otp $err , $stackTrace');
    }

    // var url = Uri.parse('https://knownjobz.com/api/verifyotp-twillio');
    // http.Response response = await http.post(url ,
    // body: {
    //   "email": widget.regData.userEmail ,
    //   "phone": widget.regData.companyPhone,
    //   "otp": otpController.text
    // });

  }

  Future<void> registerAPi() async {
    //  FCM TOKEN
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    print('The Login fcm token $fcmToken');
    String REG_URL = '${BASE_URL}register';
    var url = Uri.parse(REG_URL);
    http.Response response = await http.post(url ,
    body: {
      'candidate_or_employer': 'employer' ,
      'firstname': widget.regData.firstName ,
      'lastname': widget.regData.lastName ,
      'contact': '+91${widget.regData.userMobile}' ,
      'email': widget.regData.userEmail ,
      'password': widget.regData.password ,
      'password_confirmation': widget.regData.password ,
      'name': widget.regData.companyName,
      'location': widget.regData.companyLocation ,
      'phone': '+91 ${widget.regData.companyPhone}' ,
      'companyemail': widget.regData.companyEmail ,
      'no_of_offices': widget.regData.numberofOffices ,
      'established_in': widget.regData.establishedIn ,
      'description': widget.regData.description ,
      'is_subscribed': '1' ,
      'terms_of_use': '1' ,
      'fcm_token': fcmToken
    });
    print('The Response of register api ${response.body}');
  }
  

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<InternetProvider>(
        builder: (context, value, child) {
      return Scaffold(
        body: value.isInternet
            ? Container(
          height: height,
          width: width,
          color: Colors.white,
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
              ),
              // hSpacer().hSpace15() ,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Verify Phone',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 15,),
              Align(
                alignment: Alignment.center,
                child: Lottie.asset(VERIFICATION_LOTTIE,
                    height: 250, width: width! / 2),
              ),
              const SizedBox(height: 15,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Code is sent to ${widget.mobileNumber}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter otp we just sent to your phone number',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 70,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinCodeTextField(
                      controller: otpController,
                      length: 6,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.white,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 2,
                        )
                      ],

                      onChanged: (String code) {
                        print('The Code $code');
                        setState(() {
                          verificationCodeData = code;
                        });

                      },
                      onCompleted: (val){
                        // verifyOtp();
                      },// end onSubmit
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,) ,
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => registerAPi(),
                  child: const Text('Resend' ,
                    style: TextStyle(
                        fontSize: 15 ,
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),
              const SizedBox(height: 25,),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isLoading =  true ;
                    });
                    verifyOtp();
                  },
                  child: Container(
                    height: 55,
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: const BoxDecoration(
                        color: APPCOLOR ,
                        borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child:  Center(
                      child: isLoading? Center(
                        child: Lottie.asset(COLOR_LOADING,
                            height: 75, width: 75),
                      ) :const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
            : InternetViewer(),
      );
    });
  }
}
