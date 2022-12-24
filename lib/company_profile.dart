import 'dart:convert';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nav2/edit_company_profile/edit_company_profile.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/provider/profile_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:provider/provider.dart';
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
      
      // ignore: use_build_context_synchronously
      Provider.of<ProfileProvider>(context , listen: false).updateValues(data!);
      if(data == null){
        print('The Response of error');
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const adminlogin()));
      }else{
        setState(() {
          isLoading = false ;
        });
      }
    }else{
      // ignore: use_build_context_synchronously
      errorSnackBar('Something went wrong', context);
    }

  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;
    return  Consumer<InternetProvider>(
      builder: (context , value , child) {
        return !value.isInternet ? InternetViewer():  Scaffold(
          body: SafeArea(
            child: isLoading ? const LoadingWidget():  Consumer<ProfileProvider>(
              builder: (context , value , child) {
                print('The Provider profile Value ${value.data.toJson()}');
                return  ListView(
                  children: [
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
                          height: 860 ,
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
                              value.data.company?.logo == null ? SizedBox(
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
                                    child: Image.network(IMAGEBASEURL+value.data.company!.logo! , width: width, height : 200)),
                              ),
                              value.data.company?.name == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10),
                                child: Text(
                                  value.data.company!.name!,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              value.data.company?.createdAt == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    const Icon(Icons.timer),
                                    Text(
                                      'Member Since, ${DateFormat('yMMMMd').format(value.data.company!.createdAt!)}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              value.data.company?.location == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    const Icon(Icons.location_on_outlined),
                                    Text(
                                       value.data.company!.location!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),

                              value.data.company?.phone == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.call),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                         value.data.company!.phone!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              value.data.company?.email == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.mail),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                         value.data.company!.email!,
                                        maxLines: 3,
                                        style: const  TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              value.data.company?.website == null ? Container(): Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   Image.asset('assets/internet.png' , height : 25 , width : 25) ,
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                         value.data.company!.website!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 18,

                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => EditCompanyProfile(

                                      name: value.data.company!.name! ,

                                      email: value.data.company!.email! ,

                                      ceo: value.data.company!.ceo ?? '',

                                      industry: value.data.company?.industryId?.industry == null ? '' :
                                      value.data.company!.industryId!.industry,

                                      ownership: value.data.company?.ownershipTypeId?.ownershipType == null ? '' :
                                      value.data.company!.ownershipTypeId!.ownershipType,

                                      description: value.data.company?.description == null ? '' :
                                      value.data.company!.description,

                                      address: value.data.company?.location == null ? "" :
                                      value.data.company!.location,



                                      noOfOffice: value.data.company?.noOfOffices?.toString() == null ? "":
                                      value.data.company!.noOfOffices!.toString() ,

                                      noOfEmployees: value.data.company?.noOfEmployees?.toString() == null ? "":
                                      value.data.company!.noOfEmployees!.toString() ,

                                      establishedIn: value.data.company?.establishedIn == null ? "":
                                      value.data.company!.establishedIn!,

                                      websiteUrl: value.data.company?.website == null ? "":
                                      value.data.company!.website! ,

                                      fax: value.data.company?.fax == null ? "":
                                      value.data.company!.fax ,

                                      phone: value.data.company?.phone == null ? "" :
                                      value.data.company!.phone! ,

                                      facebook: value.data.company?.facebook ?? '',
                                      twitter: value.data.company?.twitter ?? '',
                                      linkedIn: value.data.company?.linkedin ?? '',
                                      googlePlus: value.data.company?.googlePlus ?? '',
                                      pintrest : value.data.company?.pinterest ?? '' ,
                                      industryId: value.data.company?.industry?.id.toString() == null ? "" :
                                      value.data.company!.industry!.id.toString(),
                                      ownershipId: value.data.company?.ownershipType?.id == null ? "":
                                      value.data.company!.ownershipType!.id.toString(),
                                      country: value.data.company?.countryId?.country ?? '',
                                      state:  value.data.company?.stateId?.state ?? '',
                                      city:  value.data.company?.cityId?.city ?? '',
                                      countryId: value.data.company?.countryId?.countryId ?? 0,
                                      stateID: value.data.company?.stateId?.stateId ?? 0,
                                      cityID: value.data.company?.cityId?.cityId ?? 0,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                      'Is Email Verified',
                                      style: TextStyle(fontSize: 18),
                                    ),

                                     data!.company!.verified == 0 ? Container(): 
                                     Image.asset(VERIFIED_BADGE_ICON , height: 25, width: 25,)
                                    ],
                                  ),
                                const SizedBox(height: 10,) ,
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                         bottom: 20),
                                    child: data!.company!.verified == 0 ? InkWell(
                                      onTap: () async {
                                        await LaunchApp.openApp(
                                          androidPackageName: 'com.google.android.gm'
                                        );
                                      },
                                      child:  Container(
                                        height: 45,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          color: APPCOLOR , 
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: const Center(
                                          child: Text('Verify email' , 
                                          style: TextStyle(
                                            fontSize: 15 , 
                                            color: Colors.white
                                          ),),
                                        ),
                                      ),
                                    ): const Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )),
                              Container(
                                width: 350,
                                height: 70,
                                color:  Colors.white,
                                child: Column(
                                  children: [
                                     data!.company?.noOfEmployees == null ? const SizedBox(height: 0): const  Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                           EdgeInsets.only(left: 15 , top: 10),
                                          child: Text('Total Employees',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        )),

                                    data!.company?.noOfEmployees == null ? const SizedBox(height: 0,): Align(
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
                              data!.company?.establishedIn == null ? Container(): const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                        left: 15, bottom: 5, top: 20),
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
                                        left: 15, bottom: 20),
                                    child: Text(
                                      data!.company!.establishedIn!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )),

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
                    ),]
                );
              }
            ),
          ),

        );
      }
    );
  }
}
