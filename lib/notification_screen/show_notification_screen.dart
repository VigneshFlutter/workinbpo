import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:nav2/model/notification_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowNotificationScreen extends StatefulWidget {
  const ShowNotificationScreen({Key? key}) : super(key: key);

  @override
  State<ShowNotificationScreen> createState() => _ShowNotificationScreenState();
}

class _ShowNotificationScreenState extends State<ShowNotificationScreen> {

  double? height ;
  double? width ;
  bool isLoading = true ;
  NotificationModel? data ; 

  @override
  void initState() {
    notificationApi();
    super.initState();
  }

  Future<void> notificationApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(NOTIFICATION_API);
    print('The Notification Api $NOTIFICATION_API');
    http.Response response = await http.get(url ,
    headers: {
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
        print('The Response of notification ${response.body}');
        data = NotificationModel.fromJson(jsonDecode(response.body));
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
          horizontal: 12.0
        ),
        color: Colors.white,
        child: isLoading ? const Center(
          child: LoadingWidget(),
        ): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 30,) ,

            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)) ,

            // const SizedBox(height: 20,) ,
            
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: data!.notifications!.length,
                  itemBuilder: (context , index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            flex: 3 ,
                            child: Text(data!.notifications![index].user!.name! ,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 17 ,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600
                            ),),
                          ),

                          Text(Jiffy(data!.notifications![index].createdAt!).fromNow() ,
                          style: const TextStyle(
                            fontSize: 12 ,
                            fontWeight: FontWeight.w400 ,
                            color: Colors.grey
                          ),)
                        ],
                      ) ,

                      const SizedBox(height: 2,) ,

                      Text(data!.notifications![index].message!) ,

                      const SizedBox(height: 15,) ,

                      Container(
                        height: 1,
                        width: width,
                        color: Colors.grey,
                      ) ,

                      const SizedBox(height: 15,)
                    ],
                  );
              }),
            )


            // Expanded()
          ],
        ),
      ),
    );
  }
}
