import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nav2/managemessages/manage_messages_receiv.dart';
import 'package:nav2/model/manage_followers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/loading_widget.dart';

class managemessages extends StatefulWidget {
  const managemessages({Key? key}) : super(key: key);

  @override
  State<managemessages> createState() => _managemessagesState();
}

class _managemessagesState extends State<managemessages> {

  double? height ;
  double? width ;
  ManageFollowersModel? data ;
  bool isLoading = true ;

  @override
  void initState() {
    manageMessagesApi();
    super.initState();
  }

  Future<void> manageMessagesApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(MANAGE_FOLLOWERS_URL);
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });
    print('The response of manage followers ${response.body}');
    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
        data = ManageFollowersModel.fromJson(jsonDecode(response.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: isLoading ? const LoadingWidget(): Column(
          children: [
            const SizedBox(height: 40,) ,
            const Align(
              alignment: Alignment.topLeft,
              child:  Text("Manage Followers" , style: TextStyle(
                  fontSize: 23 ,
                  fontWeight: FontWeight.w600
              ),),
            ) ,
            Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: data!.users!.length,
                  itemBuilder: (context , index){
                    return Container(
                      width: width,
                      padding:  const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration:  BoxDecoration(
                        color: Colors.white , 
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
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
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25 ,
                                backgroundImage: AssetImage(APP_LOGO),
                              ) ,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      data?.users?[index].name == null ? Container():
                                          RichText(text: TextSpan(
                                            text: data!.users![index].name! ,
                                            style: const TextStyle(
                                              fontSize: 17 ,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                            ) ,
                                            children: const [
                                              TextSpan(
                                                text: ' has following you' ,
                                                style: TextStyle(
                                                  fontSize: 16 ,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500
                                                )
                                              )
                                            ]
                                          )),

                                      const SizedBox(
                                        height: 10,
                                      ) ,

                                      Row(
                                        children: [
                                          const Icon(Icons.mail , size: 24, color: Colors.black,) ,
                                          const SizedBox(width: 10,) ,
                                          Text(data!.users![index].email! ,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 13
                                            ),)
                                        ],
                                      ) ,

                                      const SizedBox(height: 10,) ,

                                      Row(
                                        children: [
                                          const Icon(Icons.phone , size: 24, color: Colors.black,) ,
                                          const SizedBox(width: 10,) ,
                                          Text(data!.users![index].phone! ,
                                            style: const TextStyle(
                                                fontSize: 13
                                            ),)
                                        ],
                                      )
                                    ],
                                  )
                                ),
                              )
                            ],
                          ) ,

                        ],
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
