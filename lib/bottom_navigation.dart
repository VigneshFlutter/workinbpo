import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/managemessages/manage_messages.dart';
import 'package:nav2/postjobs/company_posted_jobs.dart';
  

  class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key? key}) : super(key: key);
  
  @override
  _bottom_navigationState createState() => _bottom_navigationState();
}
  
class _bottom_navigationState extends State<bottom_navigation> {
  int pageIndex = 0;
  
  final pages = [
    const dashboardpage(),
    const CompanyPostedJobs() ,
    const managemessages(),
    const companyprofile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
       
        body: Container(child: pages[pageIndex]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: pageIndex,
          onTap: (val){
            setState(() {
              pageIndex = val ;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
                icon: Icon(Icons.home,)) ,

            BottomNavigationBarItem(
                label: 'Jobs',
                icon: Icon(Icons.work,)) ,

            BottomNavigationBarItem(
                label: 'Followers',
                icon: Icon(Icons.favorite,)) ,

            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person,)) ,
          ],
        ),
      ),
    );
  }

}
  
