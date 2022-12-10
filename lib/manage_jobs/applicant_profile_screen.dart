import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/manage_jobs/call_interview_screen.dart';
import 'package:nav2/model/applicant_profile_model.dart';
import 'package:nav2/model/call_for_interview_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
  bool isShortlist = false ;

  @override
  void initState() {
    applicantProfileApi();
    super.initState();
  }


  
  Future<void> applicantProfileApi() async {
    final prefs = await SharedPreferences.getInstance(); 
    var token = prefs.getString(USER_TOKEN) ;

    print('The Application Profile ID ${widget.id}');
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
        isShortlist = data!.user!.isSubscribed == 0 ? true : false ;
      });
    }
  }

  Future<void> addShortListApi({
    String? baseurl ,
  int? applicationID ,
    int? userID ,
    int? jobID  ,
    int? companyID
}) async{
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse('$baseurl$applicationID/$userID/$jobID/$companyID');
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });

    print('The Response of ShortList APi ${response.body}');
    CallForInterviewModel data = CallForInterviewModel.fromJson(jsonDecode(response.body));

    if(data.status!){
      setState(() {
        isShortlist = !isShortlist ;
      });
      //ignore: use_build_context_synchronously
      successSnackBar('Successfully updated', context);
    }else{
      //ignore: use_build_context_synchronously
      errorSnackBar('Failed to update', context);
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
        child: isLoading ? Center(
          child: Lottie.asset(APP_LOADING , height: 45 , width: 75),
        ): ListView(
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
                  child: FadeInImage(
                    height: 65,
                    width: 65,
                    image: NetworkImage(IMAGEBASEURL+data!.user!.image!),
                    placeholder: AssetImage(NO_IMAGE_ICON),
                  ),
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

            InkWell(
              onTap: () async{
                final url = RESUME_URL+data!.profileCv!.cvFile! ;
                if(await canLaunch(url)){
                  await launch(url ,
                      forceSafariVC: false);
                }
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                    color: APPCOLOR ,
                    borderRadius: BorderRadius.circular(8)

                  ),
                  child: const Center(
                    child: Text('View Resume' ,
                    style: TextStyle(
                      fontSize: 15 ,
                      fontWeight: FontWeight.w600 ,
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20,) ,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                InkWell(
                  onTap: (){
                    if(isShortlist){
                      addShortListApi(
                          baseurl: REMOVE_SHORTLIST_API,
                          applicationID: data!.jobApplication!.id ,
                          userID: data!.jobApplication!.userId ,
                          jobID: data!.jobApplication!.jobId  ,
                          companyID: data!.company!.id
                      );
                    }else{
                      addShortListApi(
                        baseurl: ADD_SHORTLIST_API ,
                        applicationID: data!.jobApplication!.id ,
                        userID: data!.jobApplication!.userId ,
                        jobID: data!.jobApplication!.jobId  ,
                        companyID: data!.company!.id
                      );
                    }
                  },
                  child: Container(
                    height: 45,
                    width: width! / 2 - 30,
                    decoration: BoxDecoration(
                      color: ORANGE_COLOR ,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Center(
                      child: isShortlist ? const Text('Add Shortlist' ,
                        style: TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w600 ,
                            color: Colors.white
                        ),) : const Text('Remove Shortlist' ,
                      style: TextStyle(
                        fontSize: 15 ,
                        fontWeight: FontWeight.w600 ,
                        color: Colors.white
                      ),),
                    ),
                  ),
                ),

                InkWell(
                  onTap: ()=> {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) =>  CallForInterview(
                          applicationID: data!.jobApplication!.id!,
                          userID: data!.jobApplication!.userId!,
                          jobID: data!.jobApplication!.jobId! ,
                          companyID: data!.company!.id!,
                        )))
                  },
                  child: Container(
                    height: 45,
                    width: width! / 2 - 30,
                    decoration: BoxDecoration(
                        color: Colors.white ,
                        border: Border.all(
                          color: APPCOLOR
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Center(
                      child: Text('Call for interview' ,
                        style: TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w600 ,
                            color: APPCOLOR
                        ),),
                    ),
                  ),
                )
              ],
            ),

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
            // label(CAKE_ICON, 'Age: ${DateFormat('yyyy-MM-dd').format(data!.user!.dateOfBirth!).toString()}') ,

            Row(
              children: [
                Image.asset(CAKE_ICON , height: 21, width: 21,) ,
                const SizedBox(width: 15,) ,
                Text(DateFormat('yyyy-MM-dd').format(data!.user!.dateOfBirth!),
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600 ,
                      fontSize: 15
                  ),)
              ],
            ),
            

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

            SizedBox(
              height: 60* data!.profileEdu!.length.toDouble(),
              width: width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data!.profileEdu!.length,
                  itemBuilder: (context , index){

                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(CAREERLEVEL , height: 18, width: 18,) ,
                          const SizedBox(width: 10,) ,
                          Text(data!.profileEdu![index].degreeTitle! ,
                          style: const TextStyle(
                            fontSize: 15 ,
                          ),)

                        ],
                      ) ,
                      SizedBox(height: 10,) ,
                      Row(
                        children: [
                          Image.asset(GRADUATION_ICON , height: 18, width: 18,) ,
                          const SizedBox(width: 10,) ,
                          Text(data!.profileEdu![index].institution! ,
                            style: const TextStyle(
                              fontSize: 15 ,
                            ),)

                        ],
                      ) ,
                    ],
                  );
              }),
            ),

            const SizedBox(height: 15,) ,
            
            mainTitle('Experience') ,

            SizedBox(
              height: 80 * data!.profileExp!.length.toDouble(),
              width: width,
              child: ListView.builder(
                  itemCount: data!.profileExp!.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data!.profileEdu![index].degreeTitle! ,
                          style: const TextStyle(
                            fontSize: 18 ,
                            fontWeight: FontWeight.w600
                          ),) ,
                        SizedBox(height: 10,) ,
                        Row(

                          children: [
                            Image.asset(PERMANENT_JOB , height: 18, width: 18,) ,
                            const SizedBox(width: 10,) ,
                            Text(data!.profileExp![index].company! ,
                              style: const TextStyle(
                                fontSize: 15 ,
                              ),)

                          ],
                        ) ,
                        SizedBox(height: 10,) ,
                        Row(
                          children: [
                            Image.asset(SHORT_LIST_ICON , height: 18, width: 18,) ,
                            const SizedBox(width: 10,) ,
                            Text(data!.profileExp![index].description! ,
                              style: const TextStyle(
                                fontSize: 15 ,
                              ),)

                          ],
                        ) ,
                      ],
                    );
                  }),
            ),


            const SizedBox(height: 15,) ,
            
            mainTitle('Skills') ,

            Wrap(
              children: data!.profileSkills!.map((e) {
                return Chip(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blueGrey),
                    label: Text(e.jobSkill!.jobSkill! ,
                style: const TextStyle(
                  fontSize: 15 ,
                  color: Colors.blueGrey
                ),));
              }).toList(),
            ),

            const SizedBox(height: 15,) ,
            
            mainTitle('Languages') ,
            Wrap(
              children: data!.profileLangs!.map((e) {
                return Chip(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blueGrey),
                    label: Text(e.language!.lang! ,
                      style: const TextStyle(
                          fontSize: 15 ,
                          color: Colors.blueGrey
                      ),));
              }).toList(),
            ),
            const SizedBox(height: 45,) ,
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
