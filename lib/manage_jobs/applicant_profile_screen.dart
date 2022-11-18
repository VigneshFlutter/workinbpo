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
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0
        ),
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
                  child: Image.asset(NO_IMAGE_ICON , height: 65, width: 65, fit: BoxFit.fill,),
                ) : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(IMAGEBASEURL+data!.user!.image),
                ) ,

                const SizedBox(width: 18,) ,


                
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      label(PERSON_ICON, data!.user!.name!) , 
                      label(MAIL_ICON, data!.user!.email!)
                    ],
                  ),
                )
              ],
            ) , 
            
            const SizedBox(height: 20,) ,

            const Text('About Applicant' , style: TextStyle(
              fontSize: 22 ,
              fontWeight: FontWeight.w600
            ),) ,

            const SizedBox(height: 15,) ,

            data!.user!.verified == 0 ? label(MAIL_ICON, "IS Email Verified : No"):
            label(MAIL_ICON, "IS Email Verified : Yes") ,

            const SizedBox(height: 15,) ,
            
            label(CHECKMARK_ICON, 'Immediate Available: Yes') ,

            const SizedBox(height: 15,) ,
            
            data?.user?.dateOfBirth == null ? Container():
            label(CAKE_ICON, 'Age: ${data!.user!.dateOfBirth!}') ,

            const SizedBox(height: 15,) ,
            
            label(GENDER_ICON, 'Gender: Male') ,

            const SizedBox(height: 15,) ,
            
            label(MARTIAL_STATUS_ICON, 'Single') ,

            const SizedBox(height: 15,) ,
            
            label(SALARY_ICON, 'Current Salary: ${data!.user!.currentSalary}') ,

            const SizedBox(height: 15,) ,
            
            data?.user?.expectedSalary == null ? Container()
                : label(SALARY_ICON, 'Expected Salary : ${data!.user!.expectedSalary!}') ,

            const SizedBox(height: 15,) ,
            
            mainTitle('Education') ,

            const SizedBox(height: 15,) ,
            
            mainTitle('Experience') ,

            const SizedBox(height: 15,) ,
            
            mainTitle('Skills') ,

            const SizedBox(height: 15,) ,
            
            mainTitle('Languages')
            
          ],
        ),
      ),
    );
  }
  
  Widget label(String icon , String title){
    return Row(
      children: [
        Image.asset(icon , height: 21, width: 21,) , 
        const SizedBox(width: 15,) , 
        Text(title ,
        maxLines: 2,
        style: const TextStyle(
          fontWeight: FontWeight.w600 , 
          fontSize: 15
        ),)
      ],
    );
  }

  Widget mainTitle(String data){
    return Text(data ,
    style: const TextStyle(
      fontSize: 22 ,
      fontWeight: FontWeight.w600
    ),);
  }
}
