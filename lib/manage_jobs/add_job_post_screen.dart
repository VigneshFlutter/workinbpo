import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nav2/model/city_model.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:provider/provider.dart';

import '../model/district_model.dart';
import '../model/master_model.dart';

class AddJobPostScreen extends StatefulWidget {
  const AddJobPostScreen({Key? key}) : super(key: key);

  @override
  State<AddJobPostScreen> createState() => _AddJobPostScreenState();
}

class _AddJobPostScreenState extends State<AddJobPostScreen> {
  
  double? height ; 
  double? width ;

  //TextEditingController
  TextEditingController nameTextEd = TextEditingController();
  TextEditingController descriptionTextEd = TextEditingController();
  TextEditingController benifitsTextEd = TextEditingController();
  TextEditingController numberofPositionsTextEd = TextEditingController();
  TextEditingController salaryFromTextEd = TextEditingController();
  TextEditingController salaryToTextEd = TextEditingController();




  //drop down values
  String countryVal = 'Select a country' ;
  String stateVal = 'Select a state';
  String cityVal = 'Select a city' ;
  String carrerLevel = 'Select a carrer  level';
  String salaryCurrencyVal = 'Select a salary Currency' ;
  String salaryPeriodVal = 'Select a salary period' ;
  String functionalAreaVal = 'Select a Functional Area';
  String jobTypeVal = 'Select a job type';
  String jobShiftVal = 'Select a job shift';
  String genderVal = 'Select a gender';
  String degreeLevelVal = 'Select a degree' ;
  String jobExperienceVal = 'Select a job experience';

  bool isIndia = false ;
  bool isPressed = false ;
  bool isLoading = true ;
  bool isCityLoading = true ;

  String countryIndex = '' ;
  String stateIndex = '' ;
  String cityIndex = '' ;

  //Models
  MasterModel data = MasterModel();
  DistrictModel stateData = DistrictModel();
  CityModel cityData = CityModel() ;

  @override
  void initState() {
    getMasterValues();
    stateValuesApi();
    super.initState();
  }

  Future<void> getMasterValues() async {
    //Url
    var url = Uri.parse(MASTER_URL);
    http.Response response = await http.get(url);
    print('The response of master values ${response.body}');
    data = MasterModel.fromJson(jsonDecode(response.body));

    if(response.statusCode == 200){
      setState(() {
        isLoading = false ;
      });
    }
  }

  Future<void> stateValuesApi() async {
    var url = Uri.parse('${ADD_STATES_API}101');
    http.Response response = await http.get(url);
    print('The Response of state Api ${response.body}');
    if(response.statusCode == 200){
      setState(() {
        stateData = DistrictModel.fromJson(jsonDecode(response.body));
      });
    }else{
      errorSnackBar('Something went wrong! try again', context);
    }
  }

  Future<void> cityValuesApi() async {
    var url = Uri.parse('${ADD_CITY_API}$stateIndex');
    http.Response response = await http.get(url);
    print("The Response of city api ${response.body}");

    if(response.statusCode == 200) {
      setState(() {
        isCityLoading = false ;
        cityData = CityModel.fromJson(jsonDecode(response.body));
      });
    }else{
      errorSnackBar('Something went wrong! try again', context);
    }
  }


  void checkingValues() {
    if(nameTextEd.text.isEmpty){
      errorSnackBar('Please type job name', context);
    }else{
      if(descriptionTextEd.text.isEmpty){
        errorSnackBar('Please type description', context);
      }else{
        if(benifitsTextEd.text.isEmpty){
          errorSnackBar('Please type your benefits', context);
        }else{
          if(countryVal == 'Select a country'){
            errorSnackBar('Please select your country', context);
          }else if(isIndia){
            if(stateVal == 'Select a state'){
              errorSnackBar('Please choose your  state', context);
            }else{
              if(cityVal == 'Select a city'){
                errorSnackBar("Please choose your city", context);
              }
            }
          }else{
              if(carrerLevel == 'Select a carrer  level'){
                errorSnackBar('Please choose carrer level', context);
            }else{
                if(salaryFromTextEd.text.isEmpty){
                  errorSnackBar('Please type salary from', context);
                }else{
                  if(salaryToTextEd.text.isEmpty){
                    errorSnackBar('Please type salary to', context);
                  }else{
                    if(salaryCurrencyVal == 'Select a salary Currency' ){
                      errorSnackBar('Please choose salary currency', context);
                    }else{
                      if(salaryPeriodVal == 'Select a salary period'){
                        errorSnackBar('Please choose salary period', context);
                      }else{
                        if(functionalAreaVal == 'Select a Functional Area'){
                          errorSnackBar('Please choose functional area', context);
                        }else{
                          if(jobTypeVal == 'Select a job type'){
                            errorSnackBar('Please choose a job type', context);
                          }else{
                            if(jobShiftVal == 'Select a job shift'){
                              errorSnackBar('Please choose a job shift', context);
                            }else{
                              if(numberofPositionsTextEd.text.isEmpty){
                                errorSnackBar('Please type of number of positions', context);
                              }else{
                                if(genderVal == 'Select a gender'){
                                  errorSnackBar('Please choose a gender', context);
                                }else{
                                  if(degreeLevelVal == 'Select a degree'){
                                    errorSnackBar('Please choose a degree', context);
                                  }else{
                                    if(jobExperienceVal == 'Select a job experience'){
                                      errorSnackBar('Please choose a job experience', context);
                                    }else{
                                      setState(() {

                                      });
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  void countryBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height!/2 + 200,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20,) ,
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.black54 ,
                      borderRadius: BorderRadius.circular(14)
                  ),
                ) ,
                const SizedBox(
                  height: 15,
                ) ,
                const Align(
                    alignment: Alignment.topLeft,
                    child:  Text('Choose Country' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.countries!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              print('The India Index ${data.countries![index].countryId!}');
                              setState(() {
                                countryVal = data.countries![index].country! ;
                                countryIndex = data.countries![index].countryId! as String ;
                              });
                              if(data.countries![index].country! == "India"){
                                setState(() {
                                  isIndia = true ;
                                });
                              }else{
                                setState(() {
                                  isIndia = false ;
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.countries![index].country! ,
                                  style: const  TextStyle(
                                      fontSize: 16 ,
                                      fontWeight: FontWeight.w600
                                  ),) ,
                                const SizedBox(height: 10,) ,
                                Container(height: 1, width: width, color: Colors.grey,)
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      },);
  }

  void stateBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height!/2 + 200,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20,) ,
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.black54 ,
                      borderRadius: BorderRadius.circular(14)
                  ),
                ) ,
                const SizedBox(
                  height: 15,
                ) ,
                const Align(
                    alignment: Alignment.topLeft,
                    child:  Text('Choose State' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: stateData.states!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              print('The India Index ${stateData.states![index].state!}');
                              setState(() {
                                stateVal = stateData.states![index].state! ;
                                stateIndex = stateData.states![index].stateId! as String ;
                              });
                              cityValuesApi();
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(stateData.states![index].state! ,
                                  style: const  TextStyle(
                                      fontSize: 16 ,
                                      fontWeight: FontWeight.w600
                                  ),) ,
                                const SizedBox(height: 10,) ,
                                Container(height: 1, width: width, color: Colors.grey,)
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      },);
  }

  void cityBottomsheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height!/2 + 200,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20,) ,
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.black54 ,
                      borderRadius: BorderRadius.circular(14)
                  ),
                ) ,
                const SizedBox(
                  height: 15,
                ) ,
                const Align(
                    alignment: Alignment.topLeft,
                    child:  Text('Choose City' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: cityData.cities!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                cityVal = cityData.cities![index].city! ;
                                cityIndex = cityData.cities![index].cityId! as String ;
                              });
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(cityData.cities![index].city! ,
                                  style: const  TextStyle(
                                      fontSize: 16 ,
                                      fontWeight: FontWeight.w600
                                  ),) ,
                                const SizedBox(height: 10,) ,
                                Container(height: 1, width: width, color: Colors.grey,)
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      },);
  }



  @override
  Widget build(BuildContext context) {
    
    height = MediaQuery.of(context).size.height ; 
    width = MediaQuery.of(context).size.width ; 
    
    return Scaffold(
      body: Consumer<InternetProvider>(

        builder: (context, value , child) {
          return !value.isInternet? InternetViewer(): Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0
            ),
            color: Colors.white,
            child: !isLoading  ? LoadingWidget(): ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,) ,

                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: ()=> Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back , size: 24,)),
                ) ,

                const SizedBox(height: 5,) ,

                const Text('Add Job' , style: TextStyle(
                  fontSize: 22 ,
                  fontWeight: FontWeight.w600
                ),) ,

                const SizedBox(height: 20,) ,

                label('Title') ,
                const SizedBox(height: 10,) ,

                TextFormField(
                  controller: nameTextEd,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Enter job name'
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Description') ,

                const SizedBox(height: 10,) ,

                TextFormField(
                  controller: descriptionTextEd,
                  maxLines: 3,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter job description'
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Benefits') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: benifitsTextEd,
                  maxLines: 3,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter job benefits'
                  ),
                ),

                const SizedBox(height: 20,) ,


                label('Country') ,
                const SizedBox(height: 10,) ,

                InkWell(
                  onTap: ()=> countryBottomSheet(),
                  child: Container(
                    height: 55,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white ,
                        borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: Center(
                      child: Text(countryVal ,
                      style: const TextStyle(
                        fontSize: 15 ,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20,) ,

                isIndia ? label('State') : Container(),

                isIndia ? const SizedBox(height: 10,) : Container(),

                !isIndia ? Container() : InkWell(
                  onTap: ()=> {

                  },
                  child: Container(
                    height: 55,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Center(
                      child: Text(stateVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,

                isIndia ? label('City') : Container(),

                isIndia ?  const SizedBox(height: 10,) : Container(),

                !isIndia ? Container() : InkWell(
                  onTap: (){
                    if(isCityLoading){
                      errorSnackBar('Loading... Please wait ', context);
                    }else{
                      cityBottomsheet();
                    }
                  },
                  child: Container(
                    height: 55,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Center(
                      child: Text(cityVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            color: Colors.grey
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,


                label('Are you freelance') ,

                const SizedBox(height: 20,) ,

                label('Career level') ,

                const SizedBox(height: 20,) ,

                label('Salary from') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: salaryFromTextEd,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your previous salary'
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Salary to') ,

                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: salaryToTextEd,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your previous salary'
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('You want hide salary? ') ,

                const SizedBox(height: 20,) ,

                label('Salary Currency') ,

                const SizedBox(height: 20,) ,

                label('Salary Period')   ,

                const SizedBox(height: 20,) ,

                label('Functional area') ,

                const SizedBox(height: 20,) ,

                label('Job Type') ,

                const SizedBox(height: 20,) ,


                label('Job Shift') ,

                const SizedBox(height: 20,) ,

                label('Number of positions') ,

                const SizedBox(height: 20,) ,

                label('Gender') ,

                const SizedBox(height: 20,) ,

                label('Degree level') ,

                const SizedBox(height: 20,) ,

                label('Job Experience') ,

                const SizedBox(height: 20,) ,

                InkWell(
                  onTap: ()=> print('pressed'),
                  child: Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      color: APPCOLOR ,
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
  
  Widget label(String name) {
    return Text(name , 
    style: const TextStyle(
      fontSize: 15 , 
      fontWeight: FontWeight.w500
    ),);
  }
}
