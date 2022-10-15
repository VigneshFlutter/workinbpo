import 'package:flutter/material.dart';
import 'package:nav2/company_profile.dart';
import 'package:nav2/dashboard_page.dart';
import 'package:nav2/loginpage/login_page.dart';
import 'package:nav2/manage_followers.dart';
import 'package:nav2/manage_job.dart';
import 'package:nav2/managemessages/manage_messages.dart';
  

  
class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key? key}) : super(key: key);
  
  @override
  _bottom_navigationState createState() => _bottom_navigationState();
}
  
class _bottom_navigationState extends State<bottom_navigation> {
  int pageIndex = 0;
  
  final pages = [
    const dashboardpage(),
    const managemessages(),
    const managejob(),
    const companyprofile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(child: pages[pageIndex]),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.mail,
                   color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.manage_search,
                   color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.manage_search,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
  
// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 1",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
  
// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 2",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
  
// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 3",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
  
// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 4",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }