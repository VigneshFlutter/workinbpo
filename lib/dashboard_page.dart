import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nav2/loginpage/Admin_login.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:http/http.dart' as http;
import 'package:nav2/model/dashboard_model.dart';
import 'package:nav2/notification_screen/no_notification_screen.dart';
import 'package:nav2/notification_screen/show_notification_screen.dart';
import 'package:nav2/plans_and_packages/plans_and_packages.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


const buttoncolor = APPCOLOR;
const whitecolor = Color.fromARGB(255, 255, 255, 255);
const blackcolor = Color.fromARGB(255, 0, 0, 0);
const greycolor = Colors.grey;
const bluecolor = Color.fromARGB(255, 15, 28, 216);
const lightbluecolor = Color.fromARGB(255, 176, 195, 249);

class dashboardpage extends StatefulWidget {
  const dashboardpage({Key? key}) : super(key: key);

  @override
  State<dashboardpage> createState() => _dashboardpageState();
}

class _dashboardpageState extends State<dashboardpage> {

  DashboardModel? data;
  bool isLoading = true ;
  double? height ;
  double? width ;

  @override
  void initState() {
    super.initState();
    dashboardApi();
  }

  Future<void> dashboardApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(DASHBOARD_URL);
    http.Response response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    data = DashboardModel.fromJson(jsonDecode(response.body));
    print('The response of home dashboard ${data!.toJson()}');
    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
      });
    }

  }

  void deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(USER_TOKEN);
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowNotificationScreen(),
                      ),
                    ),
                child: const Icon(Icons.notifications)),
          ) ,

          Padding(
            padding: const  EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () =>  {
                  deleteToken() ,
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const adminlogin(),
                    ),
                  )
                },
                child: const Icon(Icons.logout)),
          )
        ],
        title: Center(child: SizedBox(width: 150, height: 75 , child: Image.asset(APP_LOGO))),
        backgroundColor: whitecolor,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),

      body: Consumer<InternetProvider>(
        builder: (context , value , child) {
          return value.isInternet ? SafeArea(
            child: isLoading ? LoadingWidget(): ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => managejob(),
                        ),
                      ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Image.asset(
                                      'assets/openjob.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Open jobs',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      '${data!.openjobscount!}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 50, 153, 238)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => managefollowers(),
                        ),
                      ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Image.asset(
                                      'assets/follower.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Followers',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      data!.followercount!.toString(),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => managemessages(),
                        ),
                      ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Icon(
                                      Icons.mail,
                                      size: 40,
                                      color: Color.fromARGB(255, 255, 231, 11),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Messages',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      data!.msgcount!.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 224, 202, 7),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => managejob(),
                        ),
                      ),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 170,
                              height: 150,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Image.asset(
                                      SHORT_LIST_ICON,
                                      height: 40,
                                      width: 40,
                                      color: APPCOLOR,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Shortlisted Profiles',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      data!.shortlistcount!.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 220, 69, 101)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Row(
                    children:  const [
                      Text(
                        'Plans & Membership',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: blackcolor),
                      ),
                    ],
                  ),
                ) ,

                Container(
                  height: 260,
                  width: width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(12) ,
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,) ,
                      Image.asset(PRICE_TAG, height: 150, width: 150,) ,
                      const SizedBox(height: 10,) ,
                      const Text('Manage your plans and billing history' , style: TextStyle(
                        fontSize: 13 ,
                        color: Colors.grey
                      ),) ,
                      const SizedBox(height: 20,) ,
                      InkWell(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => const PlansAndPackages())),
                        child: Container(
                          height: 35,
                          width: 85,
                          decoration: BoxDecoration(
                            color: APPCOLOR ,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Center(
                            child: Text('Plans' ,
                            style: TextStyle(
                              fontSize: 14 ,
                              color: Colors.white ,
                              fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]
            )
          )  : InternetViewer();
        }
      )
    );
  }
}


