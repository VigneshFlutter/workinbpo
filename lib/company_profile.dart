import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/edit_company_profile/edit_company_profile.dart';
import 'package:nav2/edit_profile.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/post_job.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model/profile_model.dart';

const jobcardcolor = Color.fromARGB(255, 241, 15, 15);

class companyprofile extends StatefulWidget {
  const companyprofile({Key? key}) : super(key: key);

  @override
  State<companyprofile> createState() => _companyprofileState();

}

class _companyprofileState extends State<companyprofile> {

  ProfileModel? data ;
  bool isLoading = true ;
  double? height ;
  double? width ;

  @override
  void initState() {
    profileApi();
    super.initState();
  }

  Future<void> profileApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(PROFILE_URL);
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });
    print('The Response of profile ${response.statusCode}');

    if(response.statusCode == 200){
      data = ProfileModel.fromJson(jsonDecode(response.body));
      if(data == null){
        print('The Response of error');
        Navigator.push(context, MaterialPageRoute(builder: (context) => adminlogin()));
      }else{
        setState(() {
          isLoading = false ;
        });
      }
    }else{
      errorSnackBar('Something went wrong', context);
    }

  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: SafeArea(
        child: isLoading ? const LoadingWidget():  ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Company Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: width,
                  height: 840 ,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8.0
                  ) ,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20) ,
                      data!.company!.logo! == null ? SizedBox(
                        width: width,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(APP_LOGO , width: width, height: 200,),
                        ),
                      ): SizedBox(
                        width: width,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                            child: Image.network(IMAGEBASEURL+data!.company!.logo! , width: width, height : 200)),
                      ),
                      data!.company?.name == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10),
                        child: Text(
                          data!.company!.name!,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      data!.company?.createdAt == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            const Icon(Icons.timer),
                            Text(
                              'Member Since, ${DateFormat('yMMMMd').format(data!.company!.createdAt!)}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      data!.company?.location == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            const Icon(Icons.location_on_outlined),
                            Text(
                               data!.company!.location!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      data!.company?.phone == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.call),
                            Text(
                               data!.company!.phone!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      data!.company?.email == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.mail),
                            Text(
                               data!.company!.email!,
                              style: const  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      data!.company?.website == null ? Container(): Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           Image.asset('assets/internet.png' , height : 25 , width : 25) ,
                            Text(
                               data!.company!.website!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => EditCompanyProfile(
                              name: data!.company!.name! ?? '',
                              email: data!.company!.email! ?? '',
                              ceo: data!.company!.ceo ?? '',
                              industry: '',
                              ownership: '',
                              description: '',
                              address: '',
                              noOfOffice: data?.company?.noOfOffices?.toString() == null ? "":
                              data!.company!.noOfOffices!.toString() ,

                              noOfEmployees: data?.company?.noOfEmployees?.toString() == null ? "":
                              data!.company!.noOfEmployees!.toString() ,

                              establishedIn: data?.company?.establishedIn == null ? "":
                              data!.company!.establishedIn!,

                              websiteUrl: data?.company?.website == null ? "":
                              data!.company!.website! ,

                              fax: data?.company?.fax == null ? "":
                              data!.company!.fax ,

                              phone: data?.company?.phone == null ? "" :
                              data!.company!.phone! ,

                              facebook: data!.company!.facebook ?? '',
                              twitter: data!.company!.twitter ?? '',
                              linkedIn: data!.company!.linkedin ?? '',
                              googlePlus: data!.company!.googlePlus ?? '',
                              pintrest : data!.company!.pinterest ?? '' ,
                              industryId: data?.company?.industryId == null ? "" :
                              data!.company!.industryId.toString(),
                              ownershipId: data?.company?.ownershipTypeId == null ? "":
                              data!.company!.ownershipTypeId.toString(),
                              country: '',
                              state:  '',
                              city:  '',
                            ))),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 45,
                            width: 125,
                            decoration: BoxDecoration(
                              color: Colors.black ,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Center(
                              child: Text('Edit profile' ,
                              style: TextStyle(
                                fontSize: 16 ,
                                color: Colors.white ,
                              ),),
                            ),
                          ),
                        )
                      ),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 30),
                            child: Text(
                              'Company Detail',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                         const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:  EdgeInsets.only(
                                left: 30, bottom: 5),
                            child: Text(
                              'Is Email Verified',
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, bottom: 20),
                            child: data!.company!.verified == 0 ? const Text(
                              'No',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ): const Text(
                              'Yes',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10),
                        child: Container(
                          width: 350,
                          height: 70,
                          color:  Colors.white,
                          child: Column(
                            children: [
                               data!.company?.noOfEmployees == null ? Container(): const  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                     EdgeInsets.only(left: 15 , top: 10),
                                    child: Text('Total Employees',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  )),

                              data!.company?.noOfEmployees == null ? Container(): Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 15 , top: 10),
                                    child: Text(data!.company!.noOfEmployees!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      data!.company?.establishedIn == null ? Container(): const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:  EdgeInsets.only(
                                left: 25, bottom: 5, top: 20),
                            child: Text(
                              'Established In',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      data!.company?.establishedIn == null ? Container(): Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, bottom: 20),
                            child: Text(
                              data!.company!.establishedIn!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 10, right: 10),
                      //   child: Container(
                      //     width: 350,
                      //     height: 70,
                      //     color: const Color.fromARGB(255, 228, 228, 226),
                      //     child: Align(
                      //         alignment: Alignment.centerLeft,
                      //         child: Padding(
                      //           padding:
                      //           const EdgeInsets.only(left: 15),
                      //           child: Column(
                      //             crossAxisAlignment:
                      //             CrossAxisAlignment.start,
                      //             children: const [
                      //               Padding(
                      //                 padding:  EdgeInsets.only(
                      //                     top: 10, bottom: 5),
                      //                 child: Text('Current jobs',
                      //                     style: TextStyle(
                      //                         fontSize: 18,
                      //                         fontWeight:
                      //                         FontWeight.w400)),
                      //               ),
                      //               Text('6',
                      //                   style: TextStyle(
                      //                       fontSize: 20,
                      //                       fontWeight:
                      //                       FontWeight.w700)),
                      //             ],
                      //           ),
                      //         )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            data!.company?.description == null ? Container(): Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    width: 380,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                         const Padding(
                          padding:  EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'About Company',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: Text(data!.company!.description!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, bottom: 30),
            //   child: Text(
            //     'Job openings',
            //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            //   ),
            // ),
            // SizedBox(
            //   height: 390,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Card(
            //         elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             side: BorderSide(color: greycolor),
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Container(
            //           width: 320,
            //           height: 360,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 5),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 40, bottom: 10),
            //                       child: Container(
            //                           height: 80,
            //                           width: 80,
            //                           child: Image.asset('assets/job7.jpeg')),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 15, right: 10),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: jobcardcolor,
            //                           borderRadius:
            //                               BorderRadius.circular(15)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             top: 5,
            //                             bottom: 5,
            //                             left: 20,
            //                             right: 20),
            //                         child: Text(
            //                           'Contract',
            //                           style: TextStyle(color: whitecolor),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         color: jobcardcolor,
            //                         borderRadius: BorderRadius.circular(15)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 5, bottom: 5, left: 20, right: 20),
            //                       child: Text(
            //                         'First Shift (Day)',
            //                         style: TextStyle(color: whitecolor),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 20, right: 90, top: 20, bottom: 0),
            //                 child: Text(
            //                   'Conway c',
            //                   style: TextStyle(
            //                       fontSize: 22, fontWeight: FontWeight.w800),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 18, top: 5, bottom: 5),
            //                 child: Text(
            //                   'Java Script',
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.w300),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 15, top: 5, bottom: 4),
            //                 child: Row(
            //                   children: [
            //                     Icon(Icons.location_on_outlined),
            //                     Text(
            //                       'Address',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       ' Anar Darreh',
            //                       style: TextStyle(
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w300),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("View Detail",
            //                                 style: TextStyle(
            //                                   color: whitecolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                               10), // radius of 10
            //                           color: buttoncolor,
            //
            //                           // green as background color
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => dashboardpage(),
            //                   ),
            //                 ),
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 20, right: 20, bottom: 5, top: 10),
            //                     child: Container(
            //                         width: 300,
            //                         height: 40,
            //                         child: Center(
            //                             child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Text("Save Job",
            //                                 style: TextStyle(
            //                                   color: buttoncolor,
            //                                   fontSize: 18,
            //                                 )),
            //                           ],
            //                         )),
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(
            //                                 10), // radius of 10
            //                             color: whitecolor,
            //                             border: Border.all(
            //                                 color: buttoncolor, width: 2)
            //                             // green as background color
            //                             )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 40,
            // )
          ],
        ),
      ),
      //  drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         child: const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Color.fromARGB(255, 151, 239, 249),
      //           ),
      //           child: Text('MENU'),
      //         ),
      //       ),
      //       // ListTile(
      //       //   title: const Text('Dashboard'),
      //       //   leading: Icon(
      //       //     Icons.home,
      //       //   ),
      //       //   iconColor: Colors.black,
      //       //   onTap: () => Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //       builder: (context) => dashboardpage(),
      //       //     ),
      //       //   ),
      //       // ),
      //       ListTile(
      //         title: const Text('Edit Profile'),
      //         leading: Icon(Icons.edit),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => editprofile(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Company Profile'),
      //         leading: Icon(Icons.contacts),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => companyprofile(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Post job'),
      //         leading: Icon(Icons.computer),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => postjob(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Jobs'),
      //         leading: Icon(Icons.groups_outlined),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managejob(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Message'),
      //         leading: Icon(Icons.mail),
      //         iconColor: Colors.black,
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managemessages(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Manage Followers'),
      //         iconColor: Colors.black,
      //         leading: Icon(Icons.dashboard_customize_rounded),
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => managefollowers(),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Logout'),
      //         iconColor: Colors.black,
      //         leading: Icon(Icons.logout_outlined),
      //         onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => postjob(),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
