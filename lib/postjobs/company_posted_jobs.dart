import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nav2/job_detail_page/job_detail_page.dart';
import 'package:nav2/manage_jobs/add_job_post_screen.dart';
import 'package:nav2/manage_jobs/list_candiate_screen.dart';
import 'package:nav2/manage_jobs/shortlist_job_screen.dart';
import 'package:nav2/model/company_posted_jobs_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:nav2/utils/no_results_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyPostedJobs extends StatefulWidget {
  const CompanyPostedJobs({Key? key}) : super(key: key);

  @override
  State<CompanyPostedJobs> createState() => _CompanyPostedJobsState();
}

class _CompanyPostedJobsState extends State<CompanyPostedJobs> {

  double? height ;
  double? width ;
  CompanyPostedJobsModel? data ;
  bool isLoading = true ;

  @override
  void initState() {
    companyPostedJobs();
    super.initState();
  }

  Future<void> companyPostedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(COMPANY_POSTED_JOBS_URL);
    http.Response response = await http.get(url ,
    headers: {
      'Authorization' : "Bearer $token"
    }) ;

    print('The Response of company posted jobs ${response.body}');

    if(response.statusCode == 200){
      setState(() {
        data = CompanyPostedJobsModel.fromJson(jsonDecode(response.body));
        isLoading = false ;
      });
    }else{
      errorSnackBar('Something went wrong', context);
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.white ,
        child: isLoading ? const LoadingWidget(): Column(
          children:  [
            const SizedBox(height: 40,) ,
            const Align(
              alignment: Alignment.topLeft,
              child:  Text('Company Posted Jobs' , style: TextStyle(
                fontSize: 23 ,
                fontWeight: FontWeight.w600
              ),),
            ) ,
            const SizedBox(height: 5,) ,
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: ()=> Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => const AddJobPostScreen())),
                child: Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                    color: APPCOLOR ,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Center(
                    child: Text('Add Post' ,
                    style: TextStyle(
                      fontSize: 15 ,
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,) ,
            data!.jobs!.data!.isEmpty ? Expanded(
              flex: 3,
              child: NoResultsPage(),
            ): Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: data!.jobs!.data!.length,
                  itemBuilder: (context , index){
                    return Column(
                      children: [
                        const SizedBox(height: 10,) ,
                        data?.jobs?.data?[index].company?.logo == null ? ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(APP_LOGO , height: 55, width: 95,),
                        ):
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(IMAGEBASEURL+data!.jobs!.data![index].company!.logo! ,
                                height: 95,
                                fit: BoxFit.fill,
                                width: 95,),
                            ) ,
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start ,
                                  children: [
                                    data?.jobs?.data?[index].title == null ? Container():
                                    Text(data!.jobs!.data![index].title! ,
                                    style: const TextStyle(
                                      fontSize: 19 ,
                                      fontWeight: FontWeight.w700
                                    ),) ,
                                    const SizedBox(height: 10,) ,
                                    data?.jobs?.data?[index].description == null ? Container():
                                    Text(data!.jobs!.data![index].description! ,
                                    style: const TextStyle(
                                      fontSize: 13 ,
                                      overflow: TextOverflow.ellipsis
                                    ),maxLines: 2,)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ) ,

                        const SizedBox(height: 10,) ,

                        data?.jobs?.data?[index].salaryFrom == null ? Container():
                        Row(
                          children: [
                            Image.asset(RUPEE_ICON , height: 25, width: 25,) ,
                            Expanded(
                              flex: 3,
                              child: Text('${data!.jobs!.data![index].salaryFrom} - ${data!.jobs!.data![index].salaryTo}' ,
                              style: const TextStyle(
                                fontSize: 15
                              ),),
                            )
                          ],
                        ) ,

                        const SizedBox(height: 10,) ,

                        data?.jobs?.data?[index].numOfPositions == null ? Container():
                        Row(
                          children: [
                            Image.asset(PEOPLES_ICON , height: 25, width: 25,) ,
                            Expanded(
                              flex: 3,
                              child: Text('No of positions ${data!.jobs!.data![index].numOfPositions!}' ,
                              style: const TextStyle(
                                fontSize: 15
                              ),),
                            )
                          ],
                        ) ,

                        const SizedBox(height: 20,) ,

                        Align(
                          alignment: Alignment.topRight ,
                          child: InkWell(
                            onTap: ()=> moreBottomSheet(
                             data!.jobs!.data![index].slug! ,
                              user_id: data!.jobs!.data![index].id.toString()
                            ),
                            child: Container(
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                color: APPCOLOR ,
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Center(
                                child: Text('More' ,
                                style: TextStyle(
                                  fontSize: 15 ,
                                  color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ) ,
                       
                        const SizedBox(height: 20,) ,

                        Container(height: 1, width: width, color: Colors.grey,) ,

                        // const SizedBox(height: 20,)
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void moreBottomSheet(String slug , {String? user_id}) {
    showBottomSheet(
        context: context,
        elevation: 3.0,
        builder: (context){
          return Container(
            height: height!/2,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey ,
                  blurRadius: 2.0
                ) ,
                BoxShadow(
                    color: Colors.grey ,
                    blurRadius: 2.0
                ) ,
                BoxShadow(
                    color: Colors.grey ,
                    blurRadius: 2.0
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12) ,
                topRight: Radius.circular(12)
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 20,) ,
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                const SizedBox(height: 10,) ,
                Expanded(
                  flex: 3,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          title: const Text('View a Job'),
                          leading: const  Icon(Icons.remove_red_eye , color: Colors.black,),
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(
                              builder: (context) => JobDetailPage(job_slug: slug))),
                        ),
                        ListTile(
                          title: const Text("Edit"),
                          leading:  SvgPicture.asset(EDIT_ICON),
                          onTap: ()=> print('Pressed edit '),
                        ) ,
                        ListTile(
                          title: Text('Delete'),
                          leading: SvgPicture.asset(DELETE_ICON),
                          onTap: () => print('Pressed delete'),
                        ) ,

                        ListTile(
                          title: const Text('List of Candidate'),
                          leading: SvgPicture.asset(CANDIDATE_ICON),
                          onTap: ()=> Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => ListCandidateScreen(user_id: user_id ?? ''))),
                        ) , 
                        
                        ListTile(
                          title: Text('List of shortlist'),
                          leading: Image.asset(SHORT_LIST_ICON , height: 20, width: 20,),
                          onTap: ()=> Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=> ShortListJobScreen(id: user_id ?? ''))),
                        )
                      ],
                    ))
              ],
            ),
          );
        });
  }

}