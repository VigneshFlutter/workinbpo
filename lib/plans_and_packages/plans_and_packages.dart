import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nav2/model/plans_and_packages_model.dart';
import 'package:nav2/plans_and_packages/buy_package_screen.dart';
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
            ) ,

            const SizedBox(height: 20,) ,

            data!.company!.package == null ? Container():
            const Text('Update your Packages' ,
            style: TextStyle(
                fontSize: 22 ,
                fontWeight: FontWeight.w600
            ),) ,

            SizedBox(height: 10,) ,

            SizedBox(
              height: 400 * data!.packages!.length.toDouble(),
              width: width,

              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data!.packages!.length,
                  itemBuilder: (context , index){
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height:  width! / 2 + 100,
                    width:  width! / 2 + 100,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0 ,
                      horizontal: 5.0
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white ,
                      borderRadius: BorderRadius.circular(15) ,
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
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          width: width,

                          decoration: const BoxDecoration(
                            color: Colors.deepOrangeAccent ,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15) ,
                              topRight: Radius.circular(15)
                            )
                          ),
                          child: Center(
                            child: Text(data!.packages![index].packageTitle! ,
                            style: const TextStyle(
                              fontSize: 14 ,
                              fontWeight: FontWeight.w600 ,
                              color: Colors.white
                            ),),
                          ),
                        ) ,
                        SizedBox(height: 15,) ,

                        ListTile(
                          leading: Image.asset(RUPEE_ICON , height: 21, width: 21,),
                          title: Text('Package pricing at : ${data!.packages![index].packagePrice!.toString()}' ,
                          style: const TextStyle(
                            fontSize: 13 ,
                            fontWeight: FontWeight.w500
                          ),),
                        ) ,
                        ListTile(
                          leading: Image.asset(CHECKMARK_ICON , height: 21, width: 21,),
                          title: RichText(
                            text: TextSpan(
                              text: 'Can post jobs : ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500 ,
                                color: Colors.black,
                                fontSize: 13
                              ) ,
                              children: [
                                TextSpan(
                                    text: data!.packages![index].packageNumListings!.toString(),
                                style: const TextStyle(
                                  fontSize: 16 ,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                                ))
                              ]
                            ),
                          ),
                        ) ,

                        ListTile(
                          leading: Image.asset(CHECKMARK_ICON , height: 21, width: 21,),
                          title: RichText(
                            text:  TextSpan(
                              text: "Package duration : " ,
                              style: const TextStyle(
                                fontSize: 13 ,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                              children: [
                                TextSpan(
                                  text: data!.packages![index].packageNumDays!.toString() ,
                                  style: const TextStyle(
                                    fontSize: 16 ,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                  )
                                ) ,
                                const TextSpan(
                                  text: ' days' ,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500 ,
                                    fontSize: 13
                                  )
                                )
                              ]
                            ),
                          ),
                        ) ,

                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => BuyPackageScreen(
                                    packageName: data!.packages![index].packageTitle!,
                                    price: data!.packages![index].packagePrice!.toString(),
                                    noOfDays: data!.packages![index].packageNumDays!.toString(),
                                    noOfPosts: data!.packages![index].packageNumListings!.toString())));
                          },
                          child: Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              color: APPCOLOR ,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Center(
                              child: Text('Buy a package' ,
                              style: TextStyle(
                                fontSize: 15 ,
                                color: Colors.white
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
