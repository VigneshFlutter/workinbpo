import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/bottom_navigation.dart';
import 'package:nav2/model/city_model.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/company_posted_jobs_model.dart';
import '../model/district_model.dart';
import '../model/master_model.dart';

enum FreelanceRadio { yes, no }
enum HideSalaryRadio {yes , no}

class AddJobPostScreen extends StatefulWidget {
  bool isEditProfile ;
  CompanyPostedJobsModel? jobData ;
  int? jobIndex ;
   AddJobPostScreen({Key? key ,
     required this.isEditProfile ,
     this.jobData ,
     this.jobIndex}) : super(key: key);

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

  int countryIndex = 0 ;
  String stateIndex = '' ;
  String cityIndex = '' ;
  String careerLevelIdVal = '' ;
  String salaryCurrencyIdVal = '' ;
  String salaryPeriodIdVal = '' ; 
  String functionalAreaIdVal = '' ;
  String jobTypeIdVal = '' ; 
  String jobShiftIdVal = '' ; 
  String genderIdVal = '' ; 
  String degreeLevelIdVal =  '' ; 
  String jobExperienceIdVal = '' ; 

  //Models
  MasterModel data = MasterModel();
  DistrictModel stateData = DistrictModel();
  CityModel cityData = CityModel() ;

  // radio button values 
  FreelanceRadio freelanceValue = FreelanceRadio.yes ; 
  HideSalaryRadio hideSalaryValue = HideSalaryRadio.yes ;

  @override
  void initState() {
    getMasterValues();
    stateValuesApi();
    checkingValuesOfEdit();
    super.initState();
  }
  
  void checkingValuesOfEdit() {
    if(widget.isEditProfile){

      // Name Value updating
      if(widget.jobData!.jobs!.data![widget.jobIndex!].title != null){
        setState(() {
          nameTextEd = TextEditingController(
            text: widget.jobData!.jobs!.data![widget.jobIndex!].title
          );
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].isFreelance != null){
        setState(() {
          freelanceValue = widget.jobData!.jobs!.data![widget.jobIndex!].isFreelance == 0
              ? FreelanceRadio.no : FreelanceRadio.yes;
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].hideSalary != null){
        setState(() {
          hideSalaryValue = widget.jobData!.jobs!.data![widget.jobIndex!].hideSalary == 0 ?
              HideSalaryRadio.no : HideSalaryRadio.yes ;
        });
      }


      if(widget.jobData!.jobs!.data![widget.jobIndex!].description != null){
        setState(() {
          descriptionTextEd = TextEditingController(
            text: widget.jobData!.jobs!.data![widget.jobIndex!].description
          );
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].benefits != null){
        setState(() {
          benifitsTextEd = TextEditingController(
            text: widget.jobData!.jobs!.data![widget.jobIndex!].benefits
          );
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].countryId != null){
        setState(() {
          countryVal = widget.jobData!.jobs!.data![widget.jobIndex!].countryId!.country!;
          countryIndex = widget.jobData!.jobs!.data![widget.jobIndex!].countryId!.id! ;
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].isFreelance != null){
        setState(() {

        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].careerLevelId!.careerLevel != null){
        setState(() {
          carrerLevel = widget.jobData!.jobs!.data![widget.jobIndex!].careerLevelId!.careerLevel! ;
          careerLevelIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].careerLevelId!.careerLevelId!.toString() ;
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].salaryFrom != null){
        setState(() {
          salaryFromTextEd = TextEditingController(
            text: widget.jobData!.jobs!.data![widget.jobIndex!].salaryFrom!.toString()
          );
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].salaryTo != null){
        setState(() {
          salaryToTextEd = TextEditingController(
            text: widget.jobData!.jobs!.data![widget.jobIndex!].salaryTo.toString()
          );
        });
      }

      if(widget.jobData!.jobs!.data![widget.jobIndex!].salaryCurrency != null){
        setState(() {
          salaryCurrencyVal = widget.jobData!.jobs!.data![widget.jobIndex!].salaryCurrency!;
        });
      }

      print('The Salary Period ${widget.jobData!.jobs!.data![widget.jobIndex!].salaryPeriodId!.salaryPeriod}');
      print('The Salary Period ${widget.jobData!.jobs!.data![widget.jobIndex!].salaryPeriodId!.salaryPeriodId}');

       if(widget.jobData!.jobs!.data![widget.jobIndex!].salaryPeriodId!.salaryPeriod != null){
         setState(() {
           salaryPeriodVal = widget.jobData!.jobs!.data![widget.jobIndex!].salaryPeriodId!.salaryPeriod! ;
           salaryPeriodIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].salaryPeriodId!.salaryPeriodId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].functionalAreaId!.functionalArea != null){
         setState(() {
           functionalAreaVal = widget.jobData!.jobs!.data![widget.jobIndex!].functionalAreaId!.functionalArea! ;
           functionalAreaIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].functionalAreaId!.functionalAreaId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].jobTypeId!.jobType != null){
         print('The Salary Period ${widget.jobData!.jobs!.data![widget.jobIndex!].jobTypeId!.jobType}');
         print('The Salary Period ${widget.jobData!.jobs!.data![widget.jobIndex!].jobTypeId!.jobTypeId}');
         setState(() {
           jobTypeVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobTypeId!.jobType! ;
           jobTypeIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobTypeId!.jobTypeId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].jobShiftId != null){
         setState(() {
           jobShiftVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobShiftId!.jobShift! ;
           jobShiftIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobShiftId!.jobShiftId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].numOfPositions != null){
         setState(() {
           numberofPositionsTextEd = TextEditingController(
             text: widget.jobData!.jobs!.data![widget.jobIndex!].numOfPositions!.toString()
           );
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].genderId != null){
         setState(() {
           genderVal = widget.jobData!.jobs!.data![widget.jobIndex!].genderId!.gender! ;
           genderIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].genderId!.genderId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].degreeLevelId != null){
         setState(() {
           degreeLevelVal = widget.jobData!.jobs!.data![widget.jobIndex!].degreeLevelId!.degreeLevel! ;
           degreeLevelIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].degreeLevelId!.degreeLevelId!.toString() ;
         });
       }

       if(widget.jobData!.jobs!.data![widget.jobIndex!].jobExperienceId != null){
         setState(() {
           jobExperienceVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobExperienceId!.jobExperience! ;
           jobExperienceIdVal = widget.jobData!.jobs!.data![widget.jobIndex!].jobExperienceId!.jobExperienceId!.toString() ;
         });
       }

    }
  }

  Future<void> createJobPostApi(String baseurl) async {
    final prefs = await SharedPreferences.getInstance() ; 
    var token = prefs.getString(USER_TOKEN); 

    var url = Uri.parse(baseurl);

    http.Response response = await http.post(url , 
    body: {
      "title": nameTextEd.text , 
      "description": descriptionTextEd.text , 
      "benefits": benifitsTextEd.text , 
      "country_id": countryIndex.toString() ,
      "state_id": stateIndex.toString() ,
      "city_id": cityIndex.toString() ,
      "is_freelance": freelanceValue.index.toString(), 
      "career_level_id": careerLevelIdVal.toString(),
      "salary_from": salaryFromTextEd.text,
      "salary_to": salaryToTextEd.text , 
      "hide_salary": hideSalaryValue.index.toString() , 
      "salary_currency": salaryCurrencyVal ,
      "salary_period_id": salaryPeriodIdVal , 
      "functional_area_id": functionalAreaIdVal , 
      "job_type_id": jobTypeIdVal , 
      "job_shift_id": jobShiftIdVal , 
      "num_of_positions": numberofPositionsTextEd.text , 
      "gender_id": genderIdVal , 
      "degree_level_id": degreeLevelIdVal , 
      "job_experience_id": jobExperienceIdVal  , 
      "is_active": "1" , 
      "is_featured": "1"
    } , 
    headers: {
      "Authorization": 'Bearer $token'
    });

    print('The Response of add job ${response.body}'); 
    if(response.statusCode == 200){

      // use: build_context_synchronously
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => bottom_navigation())) ;
    }else{
      errorSnackBar('Something went wrong ', context) ;
    }

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
    if(widget.isEditProfile){
      setState(() {
        isPressed = true ;
      });
      createJobPostApi('$UPDATE_POST_JOB_API${widget.jobData!.jobs!.data![widget.jobIndex!].id!}');
    }else{
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
                                        isPressed = true ;
                                      });
                                      createJobPostApi(
                                          ADD_POST_JOB_API
                                      );
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
                                countryIndex = data.countries![index].countryId! ;
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
                                stateIndex = stateData.states![index].stateId!.toString() ;
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
                                cityIndex = cityData.cities![index].cityId!.toString() ;
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

  void carrerLevelBottomSheet() {
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
                    child:  Text('Choose Career Level' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.careerLevels!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                             
                              setState(() {
                                carrerLevel = data.careerLevels![index].careerLevel! ;
                                careerLevelIdVal = data.careerLevels![index].careerLevelId!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.careerLevels![index].careerLevel! ,
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

    void salaryCurrencyBottomSheet() {
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
                    child:  Text('Choose Salary Currency' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.currencyCodes!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                salaryCurrencyVal = data.currencyCodes![index].name! ;
                                salaryCurrencyIdVal = data.currencyCodes![index].id!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.currencyCodes![index].name! ,
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

  void salaryPeriodBottomSheet() {
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
                    child:  Text('Choose Salary Period' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.salaryperiods!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                salaryPeriodVal = data.salaryperiods![index].salaryPeriod! ;
                                salaryPeriodIdVal = data.salaryperiods![index].id!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.salaryperiods![index].salaryPeriod! ,
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

  void functionalAreaBottomSheet() {
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
                    child:  Text('Choose Functional area' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.functionalAreas!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                functionalAreaVal = data.functionalAreas![index].functionalArea! ;
                                functionalAreaIdVal = data.functionalAreas![index].functionalAreaId!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.functionalAreas![index].functionalArea! ,
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

  void jobTypeBottomSheet() {
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
                    child:  Text('Choose Job type' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.jobtypes!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                jobTypeVal = data.jobtypes![index].jobType! ;
                                jobTypeIdVal = data.jobtypes![index].id!.toString() ;
                              });                            
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.jobtypes![index].jobType! ,
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

  void jobshiftBottomSheet() {
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
                    child:  Text('Choose Job shift' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.jobShifts!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                jobShiftVal = data.jobShifts![index].jobShift! ;
                                jobShiftIdVal = data.jobShifts![index].id!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.jobShifts![index].jobShift! ,
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

   void genderBottomSheet() {
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
                    child:  Text('Choose Gender' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.genders!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                genderVal = data.genders![index].gender! ;
                                genderIdVal = data.genders![index].genderId!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.genders![index].gender! ,
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

   void degreeLevelBottomSheet() {
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
                    child:  Text('Choose degree level' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.degreelevel!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                degreeLevelVal = data.degreelevel![index].degreeLevel! ;
                                degreeLevelIdVal = data.degreelevel![index].degreeLevelId!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.degreelevel![index].degreeLevel! ,
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

   void jobExperienceBottomSheet() {
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
                    child:  Text('Choose Job Experience' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.jobExperiences!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                jobExperienceVal = data.jobExperiences![index].jobExperience! ;
                                jobExperienceIdVal = data.jobExperiences![index].jobExperienceId!.toString() ;
                              });
                              
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.jobExperiences![index].jobExperience! ,
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
            child: isLoading  ? LoadingWidget(): ListView(
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
                  onTap: ()=> stateBottomSheet(),
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

                SizedBox(
                  height: 100,
                  width: width,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                           
                            Radio<FreelanceRadio>(
                            value: FreelanceRadio.yes,
                            groupValue: freelanceValue,
                            onChanged: (FreelanceRadio? value){
                              setState(() {
                                freelanceValue = value! ;
                              });
                            },
                          ) , 

                           const SizedBox(width: 10,) ,
                           const Text('Yes')  ,
                          ],
                        ),
                       
                       Row(
                        children: [
                         
                            Radio<FreelanceRadio>(
                            value: FreelanceRadio.no,
                            groupValue: freelanceValue,
                            onChanged: (FreelanceRadio? value){
                              setState(() {
                                freelanceValue = value! ;
                              });
                            },
                          ) ,
                          const SizedBox(width: 10,) ,
                          const Text('No')  ,
                           
                        ],
                       )                     
                      ],
                    ),
                  ),
                )  ,

                const SizedBox(height: 20,) ,

                label('Career level') ,

                const SizedBox(height: 10,) , 

                InkWell(
                  onTap: ()=> carrerLevelBottomSheet(),
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
                      child: Text(carrerLevel ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


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

                SizedBox(
                  height: 100,
                  width: width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio<HideSalaryRadio>(
                          value: HideSalaryRadio.yes,
                          groupValue: hideSalaryValue,
                          onChanged: (HideSalaryRadio? value){
                            setState(() {
                              hideSalaryValue = value! ;
                            });
                          },
                        ) ,
                          SizedBox(width: 10,) ,
                          Text('Yes') , 
                           
                        ],
                      ),

                       Row(
                        children: [
                          Radio<HideSalaryRadio>(
                          value: HideSalaryRadio.no,
                          groupValue: hideSalaryValue,
                          onChanged: (HideSalaryRadio? value){
                            setState(() {
                              hideSalaryValue = value! ;
                            });
                          },
                        ) ,
                          SizedBox(width: 10,) ,
                          Text('No') , 
                           
                        ],
                      ),
                    
                    ],
                  ),
                )  ,

                const SizedBox(height: 20,) ,

                label('Salary Currency') ,

                const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> salaryCurrencyBottomSheet(),
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
                      child: Text(salaryCurrencyVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Salary Period')   ,

                const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> salaryPeriodBottomSheet(),
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
                      child: Text(salaryPeriodVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,

                label('Functional area') ,


                const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> functionalAreaBottomSheet(),
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
                      child: Text(functionalAreaVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Job Type') ,

                 const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> jobTypeBottomSheet(),
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
                      child: Text(jobTypeVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,


                label('Job Shift') ,

                 const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> jobshiftBottomSheet(),
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
                      child: Text(jobShiftVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,

                label('Number of positions') ,

                const SizedBox(height: 10,) , 

                TextFormField(
                  controller: numberofPositionsTextEd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: "Enter your number of positions"
                  ),
                ),


                const SizedBox(height: 20,) ,

                label('Gender') ,

                 const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> genderBottomSheet(),
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
                      child: Text(genderVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),


                const SizedBox(height: 20,) ,

                label('Degree level') ,

                 const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> degreeLevelBottomSheet(),
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
                      child: Text(degreeLevelVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20,) ,

                label('Job Experience') ,

                 const SizedBox(height: 10,) , 
                
                 InkWell(
                  onTap: ()=> jobExperienceBottomSheet(),
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
                      child: Text(jobExperienceVal ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20,) ,

                InkWell(
                  onTap: ()=> checkingValues(),
                  child: Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      color: APPCOLOR ,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: isPressed ? Lottie.asset(APP_LOADING , height: 45 , width: 65) :  
                      const Text('Submit' , 
                      style: TextStyle(
                        fontSize: 14 , 
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ) , 

                const SizedBox(height: 30,)
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
