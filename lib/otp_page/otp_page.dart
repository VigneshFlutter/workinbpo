

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';


import '../provider/internet_provider.dart';
import '../utils/constants.dart';
import '../utils/internet_viewer.dart';

class OtpScreen extends StatefulWidget {

  String firstName ;
  String lastName ;
  String middleName ;
  String mobileNumber;

  String password ;
  String email;
  OtpScreen({
    required this.mobileNumber,
    required this.email ,
    required this.lastName ,
    required this.firstName ,
    required this.middleName ,

    required this.password});

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
    // sendOtpFirebase();
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
                  onPressed: () => print('Pressed'),
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
