import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nav2/login_page.dart';

final List<String> imagesList = [
  
  'https://wallpaperaccess.com/full/8098968.jpg',
  'https://thumbs.dreamstime.com/b/laptop-computer-displaying-logo-tcs-poznan-pol-sep-indian-multinational-information-technology-services-consulting-199962127.jpg',
  'https://1382778335.rsc.cdn77.org/wp-content/uploads/2021/05/HCL-to-Build-a-New-Digital-Foundation-for-Hitachi-ABB-Power-Grids-1.jpg',
  'https://1382778335.rsc.cdn77.org/wp-content/uploads/2019/06/Wipro-positioned-as-a-Leader-in-Gartners-Magic-Quadrant-for-Managed-Workplace-Services_-North-America.jpg',
];
final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   int _currentIndex = 0;
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WORK IN BPO',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                  height: 400,
                  color: Color.fromARGB(255, 205, 236, 229),
                  // color: Color.fromARGB(255, 154, 209, 253),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 10, bottom: 5),
                        child: Row(
                          children: [
                            Text('There are',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                            Text(' 10,000 ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 26, 181, 195),
                                    fontSize: 25)),
                            Text('Postings',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 10, top: 0, bottom: 5),
                            child: Text('here for you!',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 5),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, bottom: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Job title,location,keywords',
                                  icon: Icon(Icons.search)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 20),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, bottom: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Location',
                                  icon: Icon(Icons.location_on_outlined)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                        child: Center(
                          child: Container(
                              width: 350,
                              height: 50,
                              child: Center(
                                  child: Text("Search",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16,
                                      ))),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(5), // radius of 10
                                color: Color.fromARGB(255, 26, 181, 195),
                                // green as background color
                              )),
                        ),
                      ),
                    ],
                  )),
                  Container(
                  
                    color: Color.fromARGB(255, 205, 236, 229),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          
                          width: 120,
                          child: Image.asset('assets/job5.webp'),
                        ), SizedBox(
                          
                          width: 180,
                          child: Image.asset('assets/job4.webp'),
                        )
                      ],
                    ),
                  ),

    //  carosel slider...............

                  CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: imagesList
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        elevation: 6.0,
                        shadowColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Center(
                                
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            ),
            Center(child: Text('Why With Work In Bpo?',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500))),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child: Image.asset('assets/job3.jpeg'),
            ),
            Center(child: Text('Search for job',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500))),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child: Center(child: Text("You need Indeed’s all-in-one employer hiring platform.​. Hire with confidence. Post a job on the world's #1 job site to access more talent. Post Jobs. Post a Job in Minutes. Reach 250M Job Seekers. Number 1 Job Site. Hire Local Talent. Services: Post Jobs, Resume Search.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
            ),
             InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                width: 150,
                                height: 50,
                                child: Center(
                                    child: Text("Explore Jobs",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 255, 255),
                                          fontSize: 18,
                                        ))),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10), // radius of 10
                                  color: Color.fromARGB(255, 26, 181, 195),
                                  // green as background color
                                )),
                          ),
                        ),
                      ),
                       
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                         child: Center(child: Text('Find your best job Today',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500))),
                       ),
                       Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                         child: Center(child: Text('With Indeed, you can search millions of jobs online to find the next step in your career. With tools for job search, resumes, company reviews and more, ...',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
                       ),
                       InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                            child: Container(
                              
                                width: 150,
                                height: 50,
                                child: Center(
                                    child: Text("Get Started",
                                        style: TextStyle(
                                          color:
                                              Colors.black,
                                          fontSize: 18,
                                        ))),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10), // radius of 10
                                   color: Colors.white,
                                   border: Border.all( color: Color.fromARGB(255, 26, 181, 195),width: 3)
                                  
                                  // green as background color
                                )),
                          ),
                        ),
                      ),
                     
                       
                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: Container(
                             decoration: BoxDecoration(color: Color.fromARGB(255, 247, 219, 228),borderRadius: BorderRadius.circular(40)),
                            height: 1400,
                            child: Column(
                             
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                  
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20,right: 0,top: 30,bottom: 30),
                                   child: Text('Recent Jobs',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                                 ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                    width: 350,
                                    height: 300,
                                    
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 00,top: 20,bottom: 20),
                                          child: Row(
                                            children: [
                                              Padding(
                                                 padding: const EdgeInsets.only(right: 20),
                                                child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 22, 75, 221),
                           child: Icon(Icons.phone_android,)
                             ),
                                              ),
                             Text('Contract',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25,right: 0,top: 10,bottom: 20),
                                          child: Text('Java Script',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                                          child: Row(
                                            children: [
                                                 Padding(
                                                  padding: const EdgeInsets.only(left: 0,right: 10,),
                                                   child: Card(
                                                    elevation: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.location_on_outlined),
                                                    ),
                                                ),
                                                 ),
                                              
                                             Text('CONWAY- ANAR DARREH',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 25,right: 10,top: 10,bottom: 10),
                                               child: Text('23 minutes ago',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                                             ),
                                             SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: Image.asset('assets/jobman-removebg-preview.png'))
                                           ],
                                         ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                    width: 350,
                                    height: 300,
                                    
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 00,top: 20,bottom: 20),
                                          child: Row(
                                            children: [
                                              Padding(
                                                 padding: const EdgeInsets.only(right: 20),
                                                child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 22, 75, 221),
                           child: Icon(Icons.phone_android,)
                             ),
                                              ),
                             Text('Full Time / Permanent',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25,right: 0,top: 10,bottom: 20),
                                          child: Text('Node js',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                                          child: Row(
                                            children: [
                                                 Padding(
                                                  padding: const EdgeInsets.only(left: 0,right: 10,),
                                                   child: Card(
                                                    elevation: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.location_on_outlined),
                                                    ),
                                                ),
                                                 ),
                                              
                                             Text('CONWAY- OFU',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 25,right: 10,top: 10,bottom: 10),
                                               child: Text('1 day ago',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                                             ),
                                             SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: Image.asset('assets/jobman-removebg-preview.png'))
                                           ],
                                         ),
                                      ],
                                    ),
                                  ),
                                ),

                                 SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                    width: 350,
                                    height: 300,
                                    
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 00,top: 20,bottom: 20),
                                          child: Row(
                                            children: [
                                              Padding(
                                                 padding: const EdgeInsets.only(right: 20),
                                                child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 22, 75, 221),
                           child: Icon(Icons.phone_android,)
                             ),
                                              ),
                             Text('Freelance',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25,right: 0,top: 10,bottom: 20),
                                          child: Text('Java Developer',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                                          child: Row(
                                            children: [
                                                 Padding(
                                                  padding: const EdgeInsets.only(left: 0,right: 10,),
                                                   child: Card(
                                                    elevation: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.location_on_outlined),
                                                    ),
                                                ),
                                                 ),
                                              
                                             Text('CONWAY- CHATSWOOD',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 25,right: 10,top: 10,bottom: 10),
                                               child: Text('1 week ago',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                                             ),
                                             SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: Image.asset('assets/jobman-removebg-preview.png'))
                                           ],
                                         ),
                                      ],
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                    width: 350,
                                    height: 300,
                                    
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 00,top: 20,bottom: 20),
                                          child: Row(
                                            children: [
                                              Padding(
                                                 padding: const EdgeInsets.only(right: 20),
                                                child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 22, 75, 221),
                           child: Icon(Icons.phone_android,)
                             ),
                                              ),
                             Text('Freelance',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25,right: 0,top: 10,bottom: 20),
                                          child: Text('Flutter',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                                          child: Row(
                                            children: [
                                                 Padding(
                                                  padding: const EdgeInsets.only(left: 0,right: 10,),
                                                   child: Card(
                                                    elevation: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.location_on_outlined),
                                                    ),
                                                ),
                                                 ),
                                              
                                             Text('CONWAY- DURRES',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 25,right: 10,top: 10,bottom: 10),
                                               child: Text('6 day ago',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                                             ),
                                             SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: Image.asset('assets/jobman-removebg-preview.png'))
                                           ],
                                         ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                        ),
                         ),
                         SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                  
                                  Center(child: Text('Testimonials From Our  ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600))),
                                  Center(child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('Customers ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600)),
                                  )),
                                  Center(child: Text(" Lorem ipsum dolor sit amet elit,sed do eiusmod",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300))),
                                  Center(child: Text('tempor ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300))),
                                  ],
                                ),
                                 SizedBox(
                                  height: 50,
                                ),
                                
                          //       Center(
                          //         child: Container(
                          //           width: 350,
                          //           height: 300,
                                    
                          //           color: Colors.yellow,
                          //          child: Column(
                          //           children: [
                          //              SizedBox(
                          //               height: 80,
                          //               width: 80,
                          //                child: CircleAvatar(
                          //     backgroundColor: Color.fromARGB(255, 22, 75, 221),
                          //  child: Icon(Icons.phone_android,)
                           
                          //    ),
                          //              ),
                          //           ],
                          //          ),
                          //         ),
                          //       ),
            
         
        ],
        
       
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 151, 239, 249),
                ),
                child: Text('MENU'),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Job'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
