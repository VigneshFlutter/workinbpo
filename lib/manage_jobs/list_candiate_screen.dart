import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nav2/manage_jobs/applicant_profile_screen.dart';
import 'package:nav2/model/list_candidate_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:nav2/utils/no_results_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListCandidateScreen extends StatefulWidget {
  String user_id ;
  ListCandidateScreen({Key? key , required this.user_id}) : super(key: key);

  @override
  State<ListCandidateScreen> createState() => _ListCandidateScreenState();
}

class _ListCandidateScreenState extends State<ListCandidateScreen> {

  double? height ;
  double ? width ;
  bool isLoading = true ;
  ListCandidateModel? data ;

  @override
  void initState() {
    listCandidatesApi();
    super.initState();
  }

  Future<void> listCandidatesApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(LIST_CANDIDATED_API+widget.user_id);
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    }) ;
    print('The Response of List Candidate Api ${response.body}');
    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
        data = ListCandidateModel.fromJson(jsonDecode(response.body));
      });
    }else{
      errorSnackBar('Something went wrong ! Please try again later', context) ;
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
        color: Colors.white,
        child: isLoading ? const LoadingWidget() : Column(
          children: [
            const SizedBox(height: 30,) ,
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back , size: 24,)),
            ) ,

            const SizedBox(height: 20,) ,

            const Align(
              alignment: Alignment.topLeft,
              child:  Text('List of Candidates' ,
              style: TextStyle(
                fontWeight: FontWeight.w600 ,
                fontSize: 22
              ),),
            ) ,

            SizedBox(height: 15,) ,

            data!.jobApplications!.isEmpty ? Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.center,
                    child: NoResultsPage())):
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: data!.jobApplications!.length,
                  itemBuilder: (context , index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('Name', data!.jobApplications![index].user!.name!) ,

                        label('Current Salary', data!.jobApplications![index].currentSalary!.toString()) ,

                        label('Expected Salary', data!.jobApplications![index].expectedSalary!.toString()) ,

                        label('Salary Currency ', data!.jobApplications![index].salaryCurrency!) ,

                        const SizedBox(height: 15,) ,

                        InkWell(
                          onTap: ()=> Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) =>  ApplicantProfileScreen(
                                id: data!.jobApplications![index].id!.toString(),
                              ))),
                          child: Center(
                            child: Container(
                              height: 45,
                              width: 185,
                              decoration: BoxDecoration(
                                color: APPCOLOR ,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: const Center(
                                child: Text('View Profile' ,
                                style: TextStyle(
                                  fontSize: 15 ,
                                  fontWeight: FontWeight.w500 ,
                                  color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ) ,

                        SizedBox(height: 15,) ,

                        Container(height: 1, width: width, color: Colors.grey,) ,

                        const SizedBox(height: 15,)
                      ],
                    ) ;
                  }),
            )
          ],
        ),
      ),
    );
  }
  
  Widget label(String title , String subTitle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title , style: const TextStyle(
          fontSize: 19 ,
          fontWeight: FontWeight.w600
        ),) , 
        const SizedBox(height: 5,) , 
        Text(subTitle , 
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),) , 
        const SizedBox(height: 10,) ,
      ],
    );
  }
}
