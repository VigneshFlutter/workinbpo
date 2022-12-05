import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/model/call_for_interview_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallForInterview extends StatefulWidget {
  int applicationID ; 
  int userID ; 
  int jobID ; 
  int companyID ;
  
   CallForInterview({Key? key , 
   required this.applicationID , 
   required this.userID , 
   required this.jobID , 
   required this.companyID
   }) : super(key: key);

  @override
  State<CallForInterview> createState() => _CallForInterviewState();
}

class _CallForInterviewState extends State<CallForInterview> {
  double? height ;
  double? width ;
  bool isPressed = false ;

  String todayDate = '';
  TextEditingController locationTextEd = TextEditingController();

  @override
  void initState() {
    todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
  }
  
  Future<void> callforInterviewApi() async {
    final prefs = await SharedPreferences.getInstance(); 
    var token = prefs.getString(USER_TOKEN);

    String path = '$CALL_FOR_INTERVIEW${widget.applicationID}/${widget.userID}/${widget.jobID}/${widget.companyID}?date=$todayDate&location=${locationTextEd.text}' ;
    var url = Uri.parse(path);
    print('The Call for interview $path');
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });
    print('The Response of Call Interview ${response.body}');
    CallForInterviewModel data = CallForInterviewModel.fromJson(jsonDecode(response.body));
    setState(() {
      isPressed = false ;
    });
    if(data.status!){
      //ignore: use_build_context_synchronously
      successSnackBar('Successfully sent.', context);

      //ignore: use_build_context_synchronously
      Navigator.pop(context);
    }else{
      //ignore: use_build_context_synchronously
      errorSnackBar('Failed to send interview call', context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 20,) ,

            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ) ,

            // const SizedBox(height: 20,) ,

            const Text('Call for interview' ,
            style: TextStyle(
              fontSize: 21 ,
              fontWeight: FontWeight.w600
            ),) ,

            const SizedBox(height: 20,)  ,
            
            label('Choose a Date') ,
            const SizedBox(height: 10,) ,

            InkWell(
              onTap: () async{
                final picker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2060));

                if(picker != null){
                  setState(() {
                    todayDate = DateFormat('yyyy-MM-dd').format(picker!);
                  });
                }
              },
              child: Container(
                height: 55,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Center(
                  child: Text(todayDate ,
                  style: const TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            const SizedBox(height: 20,) ,

            label('Location') ,
            const SizedBox(height: 10,) ,
            TextFormField(
              controller: locationTextEd,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                hintText: 'Enter your location'
              ),
            ),

            const SizedBox(height: 30,),

            InkWell(
              onTap: (){
                if(locationTextEd.text.isNotEmpty){
                  callforInterviewApi();
                  setState(() {
                    isPressed = true ;
                  });
                }else{
                  errorSnackBar('Please type your prefered location!', context);
                }
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 45,
                  width: 125,
                  decoration: BoxDecoration(
                    color: APPCOLOR , 
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child:  Center(
                    child: isPressed ? Lottie.asset(APP_LOADING , height: 45 , width: 65):

                    const Text('Submit' ,
                    style: TextStyle(
                      fontSize: 15 ,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
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
  
  Widget label(String data){
    return Text(data , 
    style: const TextStyle(
      fontSize: 15 , 
      fontWeight: FontWeight.w500
    ),);
  }
}
