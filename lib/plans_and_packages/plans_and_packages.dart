import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nav2/model/plans_and_packages_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlansAndPackages extends StatefulWidget {
  const PlansAndPackages({Key? key}) : super(key: key);

  @override
  State<PlansAndPackages> createState() => _PlansAndPackagesState();
}

class _PlansAndPackagesState extends State<PlansAndPackages> {

  double? height ;
  double? width ;
  PlansAndPackagesModel? data ;
  bool isLoading = true ;

  @override
  void initState() {
    plansAndPackagesApi();
    super.initState();
  }

  Future<void> plansAndPackagesApi() async {
    final prefs = await SharedPreferences.getInstance() ;
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(PACKAGES_LIST_API);
    http.Response response = await http.get(url , headers: {
      "Authorization": "Bearer $token"
    });

    print('The Response of Packages Api ${response.body}');
    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
        data = PlansAndPackagesModel.fromJson(jsonDecode(response.body));
      });
    }else{
      errorSnackBar('something went wrong please try again later', context);
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
        padding: EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        color: Colors.white,
        child:  isLoading ? const LoadingWidget() :  ListView(
          children: [
            // const SizedBox(height: 20,) ,
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            ) ,

            const SizedBox(height: 30,) ,

            const Text('Current Plan' ,
            style: TextStyle(
              fontSize: 22 ,
              fontWeight: FontWeight.w600
            ),) ,

            const SizedBox(height: 20,) ,

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: width! / 2 + 100,
                width: width! / 2 + 100,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
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
                    ) ,
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      width: width,
                      decoration: const BoxDecoration(
                        color: Colors.green ,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15) ,
                          topLeft: Radius.circular(15)
                        )
                      ),
                      child: Center(
                        child: Text(data!.company!.package!.packageTitle! ,
                        style: const TextStyle(
                          fontSize: 16 ,
                          color: Colors.white ,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ) ,

                    const SizedBox(height: 15,) , 



                    ListTile(
                      leading: Image.asset(RUPEE_ICON , height: 25, width: 25,),
                      title: Text("Package Pricing at : ${data!.company!.package!.packagePrice!.toString()}" ,
                        style: const TextStyle(
                            fontSize: 13 ,
                            fontWeight: FontWeight.w600
                        ),),
                    ) ,

                    
                    ListTile(
                      leading: Image.asset(FROM_DATE_ICON , height: 35, width: 35,),
                      title: Text('Package starts at : ${DateFormat('yyyy-MM-dd').format(data!.company!.packageStartDate!)}' ,
                      style: const TextStyle(
                        fontSize: 13 ,
                        fontWeight: FontWeight.w600
                      ),),
                    ) ,

                    ListTile(
                      leading: Image.asset(TO_DATE_ICON , height: 35, width: 35,),
                      title: Text('Package ends at : ${DateFormat('yyyy-MM-dd').format(data!.company!.packageEndDate!)}',
                        style: const TextStyle(
                            fontSize: 13 ,
                            fontWeight: FontWeight.w600
                        ),),
                    ) ,

                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 45,
                        width: 150,
                        margin: const  EdgeInsets.symmetric(
                          horizontal: 12
                        ),
                        decoration: BoxDecoration(
                          color: APPCOLOR.withOpacity(.2) ,
                          borderRadius: BorderRadius.circular(12) ,
                          border: Border.all(
                            color: APPCOLOR
                          )
                        ),
                        child: Center(
                          child: Text('${data!.company!.availedJobsQuota!} / ${data!.company!.jobsQuota} left' ,
                          style: const TextStyle(
                            fontSize: 13 ,
                            color: APPCOLOR,
                            fontWeight: FontWeight.w700
                          ),),
                        ),
                      ),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
