import 'package:flutter/material.dart';

class homedetails extends StatefulWidget {
  const homedetails({Key? key}) : super(key: key);

  @override
  State<homedetails> createState() => _homedetailsState();
}

class _homedetailsState extends State<homedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset(
                    'assets/house3.jpeg',
                    fit: BoxFit.cover,
                  )),
                  
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2,20,000'),
                        Text('jenison,MI 49428, SF'),
                      ],
                    )),
                    Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('20 Hours ago'),
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 2.0,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment:Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,bottom: 20),
                  child: Text('House Information'),
                ),
              ),

              SizedBox(
              height: 80,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                
                children: [
                  SizedBox(
                    width: 15,
                  ),

                  SizedBox(
                width: 80,
               
                child: Container(
                   decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 5.0,
                              ),
                            ]),

                  
                  child: Center(child: Text('1416'))),
              ),
               SizedBox(
                    width: 15,
                  ),

              SizedBox(
                width: 80,
                
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 5.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('4'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 5.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('2'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 5.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('1'))),
              ),

                ],
              ),
              ),

               Padding(
                 padding: const EdgeInsets.only(top: 10,bottom: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Square Foot'),
                    ),
                    SizedBox(width: 0,),
                    Text('Bedrooms'),
                      SizedBox(width: 0,),
                    Text('Bathrooms'),
                      SizedBox(width: 5,),
                    Text('Garage'),
                      SizedBox(width: 5,),
                  ],
              ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: Column(
                   children: [
                     Text('Real estate is property consisting of land and the buildings on it, along with its natural resources such as crops, minerals or water; immovable property of this nature; an interest vested in this (also) an item of real property, (more generally) buildings or housing in general. In terms of law, real is in relation to land property and is different from personal property while estate means the "interest" a person has in that land property.It commonly contains '),
                     Text('Residences can be classified by and how they are connected to neighbouring residences and land. Different types of housing tenure can be used for the same physical type. For example, connected residences might be owned by a single entity and leased out, or owned separately with an agreement covering the relationship between units and common areas and concerns.The size of an apartment or house can be described in square feet or meters. '),
            
                   ],
                 ),
               ),
              
            ],
          ),
        ),
      ),
    );
  }
}



class homedetails2 extends StatefulWidget {
  const homedetails2({Key? key}) : super(key: key);

  @override
  State<homedetails2> createState() => _homedetails2State();
}

class _homedetails2State extends State<homedetails2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset(
                    'assets/house2.jpeg',
                    fit: BoxFit.cover,
                  )),
                  
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2,20,000'),
                        Text('jenison,MI 49428, SF'),
                      ],
                    )),
                    Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('20 Hours ago'),
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment:Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,bottom: 20),
                  child: Text('House Information'),
                ),
              ),

              SizedBox(
              height: 80,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                
                children: [
                  SizedBox(
                    width: 15,
                  ),

                  SizedBox(
                width: 80,
               
                child: Container(
                   decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),

                  
                  child: Center(child: Text('1416'))),
              ),
               SizedBox(
                    width: 15,
                  ),

              SizedBox(
                width: 80,
                
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('4'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('2'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('1'))),
              ),

                ],
              ),
              ),

               Padding(
                 padding: const EdgeInsets.only(top: 10,bottom: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Square Foot'),
                    ),
                    SizedBox(width: 0,),
                    Text('Bedrooms'),
                      SizedBox(width: 0,),
                    Text('Bathrooms'),
                      SizedBox(width: 5,),
                    Text('Garage'),
                      SizedBox(width: 5,),
                  ],
              ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: Column(
                   children: [
                     Text('Real estate is property consisting of land and the buildings on it, along with its natural resources such as crops, minerals or water; immovable property of this nature; an interest vested in this (also) an item of real property, (more generally) buildings or housing in general. In terms of law, real is in relation to land property and is different from personal property while estate means the "interest" a person has in that land property.It commonly contains '),
                     Text('Residences can be classified by and how they are connected to neighbouring residences and land. Different types of housing tenure can be used for the same physical type. For example, connected residences might be owned by a single entity and leased out, or owned separately with an agreement covering the relationship between units and common areas and concerns.The size of an apartment or house can be described in square feet or meters. '),
            
                   ],
                 ),
               ),
              
            ],
          ),
        ),
      ),
    );
    
  }
}

class homedetails3 extends StatefulWidget {
  const homedetails3({Key? key}) : super(key: key);

  @override
  State<homedetails3> createState() => _homedetails3State();
}

class _homedetails3State extends State<homedetails3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset(
                    'assets/house1.jpeg',
                    fit: BoxFit.cover,
                  )),
                  
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2,20,000'),
                        Text('jenison,MI 49428, SF'),
                      ],
                    )),
                    Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('20 Hours ago'),
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment:Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,bottom: 20),
                  child: Text('House Information'),
                ),
              ),

              SizedBox(
              height: 80,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                
                children: [
                  SizedBox(
                    width: 15,
                  ),

                  SizedBox(
                width: 80,
               
                child: Container(
                   decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),

                  
                  child: Center(child: Text('1416'))),
              ),
               SizedBox(
                    width: 15,
                  ),

              SizedBox(
                width: 80,
                
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('4'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('2'))),
              ),
               SizedBox(
                    width: 15,
                  ),
               SizedBox(
                width: 80,
            
                child: Container(
                 decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Color.fromARGB(255, 214, 211, 211),
                                blurRadius: 20.0,
                              ),
                            ]),
                  
                  child: Center(child: Text('1'))),
              ),

                ],
              ),
              ),

               Padding(
                 padding: const EdgeInsets.only(top: 10,bottom: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Square Foot'),
                    ),
                    SizedBox(width: 0,),
                    Text('Bedrooms'),
                      SizedBox(width: 0,),
                    Text('Bathrooms'),
                      SizedBox(width: 5,),
                    Text('Garage'),
                      SizedBox(width: 5,),
                  ],
              ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: Column(
                   children: [
                     Text('Real estate is property consisting of land and the buildings on it, along with its natural resources such as crops, minerals or water; immovable property of this nature; an interest vested in this (also) an item of real property, (more generally) buildings or housing in general. In terms of law, real is in relation to land property and is different from personal property while estate means the "interest" a person has in that land property.It commonly contains '),
                     Text('Residences can be classified by and how they are connected to neighbouring residences and land. Different types of housing tenure can be used for the same physical type. For example, connected residences might be owned by a single entity and leased out, or owned separately with an agreement covering the relationship between units and common areas and concerns.The size of an apartment or house can be described in square feet or meters. '),
            
                   ],
                 ),
               ),
              
            ],
          ),
        ),
      ),
    );
    
  }
}
