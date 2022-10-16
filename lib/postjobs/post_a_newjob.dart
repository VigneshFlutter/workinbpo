import 'package:flutter/material.dart';

import '../utils/constants.dart';


class post_a_newjob extends StatefulWidget {
  const post_a_newjob({Key? key}) : super(key: key);

  @override
  State<post_a_newjob> createState() => _post_a_newjobState();
}

class _post_a_newjobState extends State<post_a_newjob> {
   
  final _selectjobtype1 = TextEditingController();
  final _selectjobtype2 = TextEditingController();
  final _selectjobtype3 = TextEditingController();
  final _selectjobtype4 = TextEditingController();

  
   String selectjobtype1 = "contract";
   String selectjobtype2= "Freelance";
   String selectjobtype3 = "Full Time/Permanent";
   String selectjobtype4 = "Internship";
   
  final _SelectFunctionArea1 = TextEditingController();
  final _SelectFunctionArea2 = TextEditingController();
  final _SelectFunctionArea3 = TextEditingController();
  final _SelectFunctionArea4 = TextEditingController();


   String SelectFunctionArea1 = "Accountant";
   String SelectFunctionArea2= "Administration Clerical";
   String SelectFunctionArea3 = "Administration";
   String SelectFunctionArea4 = "Account,Finance & Financial Services";


  final _SelectCareerLevel1 = TextEditingController();
  final _SelectCareerLevel2 = TextEditingController();
  final _SelectCareerLevel3 = TextEditingController();
  final _SelectCareerLevel4 = TextEditingController();

  
   String SelectCareerLevel1 = "Department Head";
   String SelectCareerLevel2= "Entry Level";
   String SelectCareerLevel3 = "Experienced Professional";
   String SelectCareerLevel4 = "GM/CEO/Country Head/President";

  final _SelectRequiredDegreeLevel1 = TextEditingController();
  final _SelectRequiredDegreeLevel2 = TextEditingController();
  final _SelectRequiredDegreeLevel3 = TextEditingController();
  final _SelectRequiredDegreeLevel4 = TextEditingController();

  
   String SelectRequiredDegreeLevel1 = "Associate degree";
   String SelectRequiredDegreeLevel2= "Bechelor's degree";
   String SelectRequiredDegreeLevel3 = "Master's degree";
   String SelectRequiredDegreeLevel4 = "Doctoral degree";


  
  

   String _selected = 'Select job type';
   String _selected1 = 'Select Function Area ';
   String _selected2 = 'Select Career Level ';
   String _selected3 = 'Select Required Degree Level ';


   
  List<String> _items0 = ['contract' ,'Freelance', 'Full Time/Permanent', 'Internship','Part Time'];
  List<String> _items1 = ['Accountant','Accountant', 'Administration', 'Administration Clerical','Account,Finance & Financial Services'];
  List<String> _items2 = ['Department Head','Entry Level', 'Experienced Professional', 'GM/CEO/Country Head/President','Intern/Student'];
  List<String> _items3 = ['Associate degree',"Bechelor's degree", "Master's degree", 'Doctoral degree',]; 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        title: Container(
          width: 80,
          child: Image.asset(APP_LOGO)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
            iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 1, 0)),
      ),

   body:   SafeArea(
     child: Center(
          child: ListView(
           
            children: <Widget>[

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,bottom: 20),
                  child: Text('Post a new job',style:TextStyle(fontSize: 25,fontWeight: FontWeight.w800) ,),
                )),
              SizedBox(
                height: 6,
              ),

             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
               child: TextField(
  decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black,),borderRadius: BorderRadius.circular(8) //<-- SEE HERE
    ),
    labelText: 'Job title'
  ),
),
             ),

              Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                child: SizedBox(
                  width: 345,
                  height: 58,
                 
                  child: ElevatedButton(
                    
                    // color: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(color: Colors.black),
                    //   borderRadius: BorderRadius.circular(8)),
                    
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' $_selected',style:TextStyle(fontWeight: FontWeight.w300) ,),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Icon(
                            Icons.arrow_drop_down,size: 40,),
                        )
                      ],
                    ),
                    onPressed: () => showModal(context),
                  ),
                ),
              ),


             
               Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                 child: SizedBox(
                  width: 345,
                  height: 58,
                 
                  child: ElevatedButton(
                    
                    // color: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(color: Colors.black),
                    //   borderRadius: BorderRadius.circular(8)),
                    
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' $_selected1',style:TextStyle(fontWeight: FontWeight.w300) ,),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Icon(
                            Icons.arrow_drop_down,size: 40,),
                        )
                      ],
                    ),
                    onPressed: () => showModal1(context),
                  ),
              ),
               ),


             
               Padding(
                 padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                 child: SizedBox(
                  width: 345,
                  height: 58,
                 
                  child: ElevatedButton(
                    
                    // color: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(color: Colors.black),
                    //   borderRadius: BorderRadius.circular(8)),
                    
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' $_selected2',style:TextStyle(fontWeight: FontWeight.w300) ,),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Icon(
                            Icons.arrow_drop_down,size: 40,),
                        )
                      ],
                    ),
                    onPressed: () => showModal2(context),
                  ),
              ),
               ),
              
           
               Padding(
                 padding: const EdgeInsets.only(left: 10,right: 10,bottom: 0),
                 child: SizedBox(
                  width: 345,
                  height: 58,
                 
                  child: ElevatedButton(
                    
                    // color: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(color: Colors.black),
                    //   borderRadius: BorderRadius.circular(8)),
                    
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' $_selected3',style:TextStyle(fontWeight: FontWeight.w300) ,),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Icon(
                            Icons.arrow_drop_down,size: 40,),
                        )
                      ],
                    ),
                    onPressed: () => showModal3(context),
                  ),
              ),
               ),
              SizedBox(height: 20,),

               InkWell(
                                  // onTap: () => Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => post_a_newjob(),
                                  //   ),
                                  // ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                          width: 150,
                                          height: 45,
                                          child: Center(
                                              child: Text(
                                                  "Save ",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 16,
                                                  ))),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color:
                                                  Color.fromARGB(255, 0, 16, 234)

                                              // green as background color
                                              )),
                                    ),
                                  ),
                                ),


              
               
               
            
             
            ],
          ),
        ),
   ),
    );
  }

 


void showModal(context){
    
  showModalBottomSheet(
     
  shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15),
  ),
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            decoration: BoxDecoration(
 // or some other color
      borderRadius: BorderRadius.circular(10)
      // topLeft: Radius.circular(10.0),
      // topRight: Radius.circular(10.0)
       
     ),
         padding: EdgeInsets.only(top: 0,left: 5),
           
            height: 300,
            alignment: Alignment.center,
           child:ListView(
            children: [
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.blue,
             
            thickness: 5,
            indent: 100,
            endIndent: 100,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    TextButton(onPressed: () 
    {
      setState(() {
        _selected = selectjobtype1;
      });
       Navigator.of(context).pop();
    }, child:  Text(selectjobtype1,style: TextStyle(color: Colors.black),),),
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
                   controller:_selectjobtype1,
                decoration: InputDecoration(border: OutlineInputBorder()),
           

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                selectjobtype1 = _selectjobtype1.text;
                
                
              });
                  Navigator.of(context).pop();
              
              },
              child: const Text('save'),
            ),

          ],
        ),
      ),
      child: Icon(Icons.edit)
    ),
    
                   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected = selectjobtype2;
      });
       Navigator.of(context).pop();
    }, child:  Text(selectjobtype2),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_selectjobtype1

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                selectjobtype2= _selectjobtype1.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected = selectjobtype3;
      });
       Navigator.of(context).pop();
    }, child:  Text(selectjobtype3),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_selectjobtype3

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                selectjobtype3= _selectjobtype3.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected = selectjobtype4;
      });
       Navigator.of(context).pop();
    }, child:  Text(selectjobtype4),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_selectjobtype4

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                selectjobtype4= _selectjobtype4.text;
                
                
              });
                Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

           
           
           
              ],
          
           ),
          ),
        );
   
      }
   
    );
    
  }
  
  void showModal1(context){
    
  showModalBottomSheet(
     
  shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15),
  ),
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            decoration: BoxDecoration(
 // or some other color
      borderRadius: BorderRadius.circular(10)
      // topLeft: Radius.circular(10.0),
      // topRight: Radius.circular(10.0)
       
     ),
         padding: EdgeInsets.only(top: 0,left: 5),
           
            height: 300,
            alignment: Alignment.center,
           child:Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.blue,
             
            thickness: 5,
            indent: 100,
            endIndent: 100,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    TextButton(onPressed: () 
    {
      setState(() {
        _selected1 = SelectFunctionArea1;
      });
    }, child:  Text(SelectFunctionArea1,style: TextStyle(color: Colors.black),),),
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectFunctionArea1

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                SelectFunctionArea1 = _SelectFunctionArea1.text;
                
                
              });
                  Navigator.of(context).pop();
              
              },
              child: const Text('save'),
            ),

          ],
        ),
      ),
      child: Icon(Icons.edit)
    ),
    
                   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected1 = SelectFunctionArea2;
      });
    }, child:  Text(SelectFunctionArea2),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectFunctionArea1

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                SelectFunctionArea2= _SelectFunctionArea1.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected1 = SelectFunctionArea3;
      });
    }, child:  Text(SelectFunctionArea3),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectFunctionArea3

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectFunctionArea3= _SelectFunctionArea3.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected1 = SelectFunctionArea4;
      });
       Navigator.of(context).pop();
    }, child:  Text(SelectFunctionArea4),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectFunctionArea4

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectFunctionArea4= _SelectFunctionArea4.text;
                
                
              });
                Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

           
           
           
              ],
          
           ),
          ),
        );
   
      }
   
    );
    
  }


void showModal2(context){
    
  showModalBottomSheet(
     
  shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15),
  ),
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            decoration: BoxDecoration(
 // or some other color
      borderRadius: BorderRadius.circular(10)
      // topLeft: Radius.circular(10.0),
      // topRight: Radius.circular(10.0)
       
     ),
         padding: EdgeInsets.only(top: 0,left: 5),
           
            height: 300,
            alignment: Alignment.center,
           child:Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.blue,
             
            thickness: 5,
            indent: 100,
            endIndent: 100,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    TextButton(onPressed: () 
    {
      setState(() {
        _selected2 = SelectCareerLevel1;
      });
    }, child:  Text(SelectCareerLevel1,style: TextStyle(color: Colors.black),),),
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectCareerLevel1

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
                SelectCareerLevel1 = _SelectCareerLevel1.text;
                
                
              });
                  Navigator.of(context).pop();
              
              },
              child: const Text('save'),
            ),

          ],
        ),
      ),
      child: Icon(Icons.edit)
    ),
    
                   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected2 = SelectCareerLevel2;
      });
    }, child:  Text(SelectCareerLevel2),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectCareerLevel2

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectCareerLevel2= _SelectCareerLevel2.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected2 = SelectCareerLevel3;
      });
    }, child:  Text(SelectCareerLevel3),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectCareerLevel3

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectCareerLevel3= _SelectCareerLevel3.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected2 = SelectCareerLevel4;
      });
       Navigator.of(context).pop();
    }, child:  Text(SelectCareerLevel4),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectCareerLevel4

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectCareerLevel4= _SelectCareerLevel4.text;
                
                
              });
                Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

           
           
           
              ],
          
           ),
          ),
        );
   
      }
   
    );
    
  }
  void showModal3(context){
    
  showModalBottomSheet(
     
  shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15),
  ),
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            decoration: BoxDecoration(
 // or some other color
      borderRadius: BorderRadius.circular(10)
      // topLeft: Radius.circular(10.0),
      // topRight: Radius.circular(10.0)
       
     ),
         padding: EdgeInsets.only(top: 0,left: 5),
           
            height: 300,
            alignment: Alignment.center,
           child:Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.blue,
             
            thickness: 5,
            indent: 100,
            endIndent: 100,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    TextButton(onPressed: () 
    {
      setState(() {
        _selected3 = SelectRequiredDegreeLevel1;
      });
    }, child:  Text(SelectRequiredDegreeLevel1,style: TextStyle(color: Colors.black),),),
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectRequiredDegreeLevel1

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectRequiredDegreeLevel1 = _SelectRequiredDegreeLevel1.text;
                
                
              });
                  Navigator.of(context).pop();
              
              },
              child: const Text('save'),
            ),

          ],
        ),
      ),
      child: Icon(Icons.edit)
    ),
    
                   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected3 = SelectRequiredDegreeLevel2;
      });
    }, child:  Text(SelectRequiredDegreeLevel2),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectRequiredDegreeLevel2

            ),
            ],
          ),
         
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
              SelectRequiredDegreeLevel2= _SelectRequiredDegreeLevel2.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected3 = SelectRequiredDegreeLevel3;
      });
    }, child:  Text(SelectRequiredDegreeLevel3),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectRequiredDegreeLevel3

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectRequiredDegreeLevel3= _SelectRequiredDegreeLevel3.text;
                
                
              });
                  Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),
             
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextButton(onPressed: () 
    {
      setState(() {
        _selected3 = SelectRequiredDegreeLevel4;
      });
       Navigator.of(context).pop();
    }, child:  Text(SelectRequiredDegreeLevel4),),
                   
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              TextField(
              controller:_SelectRequiredDegreeLevel4

            ),
            ],
          ),
        
          actions: <Widget>[
            
            TextButton(
              onPressed: (){
                 setState(() {
               SelectRequiredDegreeLevel4= _SelectRequiredDegreeLevel4.text;
                
                
              });
                Navigator.of(context).pop();
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
           child: Icon(Icons.edit)
    ),
   
                  ],
                ),
                 Divider(
                color: Colors.black,
             
          
              ),

           
           
           
              ],
          
           ),
          ),
        );
   
      }
   
    );
  }
    
  }
  