import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nav2/model/applicant_profile_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApplicantProfileScreen extends StatefulWidget {
  String id ;
   ApplicantProfileScreen({Key? key , required this.id}) : super(key: key);

  @override
  State<ApplicantProfileScreen> createState() => _ApplicantProfileScreenState();
}

class _ApplicantProfileScreenState extends State<ApplicantProfileScreen> {

  double? height ;
  double? width ;
  bool isLoading = true ;
  ApplicantProfileModel? data ;

  @override
  void initState() {
    applicantProfileApi();
    super.initState();
  }
  
  Future<void> applicantProfileApi() async {
    final prefs = await SharedPreferences.getInstance(); 
    var token = prefs.getString(USER_TOKEN) ;
    
    var url = Uri.parse(APPLICANT_PROFILE_API+widget.id);
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });
    print('The Response of Applicant Profile APi ${response.body}');
    if(response.statusCode == 200){
      setState(() {
        data = ApplicantProfileModel.fromJson(jsonDecode(response.body));
        isLoading = false ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;


    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white ,
        child: ListView(
          children:  [
            const SizedBox(height: 20,) ,

            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: const Icon(Icons.arrow_back , size: 24,),
              ),
            ) ,

            const SizedBox(height: 20,) ,

            const Align(
              alignment: Alignment.topLeft,
              child: Text('Applicant Profile' ,
              style: TextStyle(
                fontSize: 22 ,
                fontWeight: FontWeight.w600
              ),
              ),
            ) ,

            const SizedBox(height: 15,) ,

            Row(
              children: [
                data?.user?.image == null ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(NO_IMAGE_ICON , height: 180, width: 180, fit: BoxFit.fill,),
                ) : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(IMAGEBASEURL+data!.user!.image),
                ) ,

                const SizedBox(width: 18,)

              ],
            )
          ],
        ),
      ),
    );
  }
}
