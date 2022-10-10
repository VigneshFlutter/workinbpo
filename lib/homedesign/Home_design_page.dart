

import 'package:flutter/material.dart';
import 'package:nav2/homedesign/home_details.dart';
import 'package:nav2/login_page.dart';

class Homedesign extends StatefulWidget {
  const Homedesign({Key? key}) : super(key: key);

  @override
  State<Homedesign> createState() => _HomedesignState();
}

class _HomedesignState extends State<Homedesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 214, 211, 211),
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.menu),
                  )),
                  Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 214, 211, 211),
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                   child:Icon(Icons.settings),
                  )), ],
          ),
          ),

            Padding(
             padding: const EdgeInsets.only(left: 30,right: 10,top: 10,bottom: 0),
              child: Text('City',style: TextStyle(fontSize: 16),),
            ),
            Padding(
               padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              child: Card(
                child: Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                           color: Color.fromARGB(255, 214, 211, 211),
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7,left: 7),
                    child: Text('San Francisco',style: TextStyle(fontSize: 22),),
                  ),
                  
                  height: 40,
                 
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 231, 231, 231),
                      boxShadow: [
                        new BoxShadow(
                           color: Colors.white,
                          blurRadius: 2.0,
                        ),
                      ]),
                 
                    height: 20,
                    width: 110,
                    child: Center(child: Text("2,20,000",style: TextStyle(fontWeight: FontWeight.w500),)),
                  ), 
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 231, 231, 231),
                      boxShadow: [
                        new BoxShadow(
                           color: Colors.white,
                          blurRadius: 10.0,
                        ),
                      ]),
                    
                    height: 20,
                    width: 110,
                     child: Center(child: Text("For Sale",style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 231, 231, 231),
                      boxShadow: [
                        new BoxShadow(
                           color: Colors.white,
                          blurRadius: 20.0,
                        ),
                      ]),
                    height: 20,
                    width: 110,
                     child: Center(child: Text("1-2 Beds",style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                   Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 231, 231, 231),
                      boxShadow: [
                        new BoxShadow(
                           color: Colors.white,
                          blurRadius: 20.0,
                        ),
                      ]),
                    height: 20,
                    width: 110,
                     child: Center(child: Text("2-3 Beds",style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                   Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 231, 231, 231),
                      boxShadow: [
                        new BoxShadow(
                           color: Colors.white,
                          blurRadius: 20.0,
                        ),
                      ]),
                    height: 20,
                    width: 110,
                     child: Center(child: Text("3-4 Beds",style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
               
                ]),

            ),
            
             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
               child: InkWell(
                 onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homedetails(),
                        ),
                      ),
                 child: Container(
                  height: 250,
                   child: ClipRRect(
  borderRadius: BorderRadius.circular(20), // Image border
  child: SizedBox.fromSize(
    size: Size.fromRadius(48), // Image radius
   child: Image.asset('assets/house3.jpeg',fit: BoxFit.cover,),
  ),
),
                 ),
               ),
             ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 10),
                   child: Text('10,20,000',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                 ),
                 Text('Jenison,MI 49428,SF',style: TextStyle(fontWeight: FontWeight.w300,),),
                 
               ],
             ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 10,top: 5),
                 child: Text("4 bedrooms / 2 bathrooms / 1416 sqft"),
               ),
             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
               child: InkWell(
                 onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homedetails2(),
                        ),
                      ),
                 child: Container(
                  height: 250,
                   child: ClipRRect(
  borderRadius: BorderRadius.circular(20), // Image border
  child: SizedBox.fromSize(
    size: Size.fromRadius(48), // Image radius
   child: Image.asset('assets/house2.jpeg',fit: BoxFit.cover,),
  ),
),
                 ),
               ),
             ),
              Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 10),
                   child: Text('18,20,000',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                 ),
                 Text('Jenison,MI 49428,SF',style: TextStyle(fontWeight: FontWeight.w300,),),
                 
               ],
             ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 10,top: 5),
                 child: Text("4 bedrooms / 2 bathrooms / 1416 sqft"),
               ),
             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
               child: InkWell(
                 onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homedetails3(),
                        ),
                      ),
                 child: Container(
                  height: 250,
                   child: ClipRRect(
  borderRadius: BorderRadius.circular(20), // Image border
  child: SizedBox.fromSize(
    size: Size.fromRadius(48), // Image radius
   child: Image.asset('assets/house1.jpeg',fit: BoxFit.cover,),
  ),
),
                 ),
               ),
             ),
              Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 10),
                   child: Text('5,20,000',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                 ),
                 Text('Jenison,MI 49428,SF',style: TextStyle(fontWeight: FontWeight.w300,),),
                 
               ],
             ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 10,top: 5),
                 child: Text("4 bedrooms / 2 bathrooms / 1416 sqft"),
               ),
         
      ]),
    )
    );
  }
}

