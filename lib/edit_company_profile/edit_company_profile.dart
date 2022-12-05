import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/model/city_model.dart';
import 'package:nav2/model/district_model.dart';
import 'package:nav2/model/edit_profile_model.dart';
import 'package:nav2/model/master_model.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditCompanyProfile extends StatefulWidget {
  String? name ;
  String? email;
  String? ceo  ;
  String? industry ;
  String? ownership ;
  String? description ;
  String? address ;
  String? noOfOffice ;
  String? noOfEmployees ;
  String? establishedIn;
  String? websiteUrl ;
  String? fax ;
  String? phone ;
  String? facebook;
  String? twitter ;
  String? linkedIn ;
  String? googlePlus;
  String? pintrest ;
  String? country;
  String? state ;
  String? city ;
  int? countryId ;
  int? stateID;
  int? cityID ;
  String? industryId ;
  String? ownershipId ;
  EditCompanyProfile({super.key,
  this.name ,
  this.email ,
    this.ceo ,
    this.industry ,
    this.ownership ,
    this.description ,
    this.address ,
    this.noOfOffice ,
    this.noOfEmployees,
    this.establishedIn ,
    this.websiteUrl ,
    this.fax ,
    this.phone ,
    this.facebook ,
    this.twitter ,
    this.linkedIn ,
    this.googlePlus ,
    this.pintrest ,
    this.country ,
    this.state ,
    this.city ,
    this.countryId ,
    this.stateID ,
    this.cityID,
    this.industryId ,
    this.ownershipId
  }) ;

  @override
  State<EditCompanyProfile> createState() => _EditCompanyProfileState();
}

class _EditCompanyProfileState extends State<EditCompanyProfile> {

  double? height ;
  double? width ;
  MasterModel data = MasterModel();
  bool isLoading = true ;
  bool isPressed = false ;

  String countryValue = 'Select a country' ;
  String cityValue = 'Select a city';
  String stateValue = 'Select a state';
  String industryValue = 'Select a industry';
  String ownerShipValue = 'Select a ownership';

  int countryIndex = 0 ;
  int stateIndex = 0 ;
  int cityIndex = 0 ;
  dynamic industryIndex = 0 ;
  dynamic ownerShipIndex = 0 ;
  bool isStateLoading = true ;
  bool isCityLoading = true ;
  bool isIndia = false ;
  File? user_image ;


  TextEditingController nameTextEd = TextEditingController();
  TextEditingController emailTextEd = TextEditingController();
  TextEditingController changePasswordTextEd = TextEditingController();
  TextEditingController ceoNameTextEd = TextEditingController();
  TextEditingController industryTextEd = TextEditingController();
  TextEditingController ownershipTextEd = TextEditingController();
  TextEditingController descriptionTextEd = TextEditingController();
  TextEditingController addressTextEd = TextEditingController();
  TextEditingController noOfOfiiceTextEd = TextEditingController();
  TextEditingController noOfEmployeesTextEd = TextEditingController();
  TextEditingController establishedInTextEd = TextEditingController();
  TextEditingController websiteUrlTextEd = TextEditingController();
  TextEditingController faxTextEd  = TextEditingController();
  TextEditingController phoneTextEd = TextEditingController();
  TextEditingController facebookTextEd = TextEditingController();
  TextEditingController twitterTextEd = TextEditingController();
  TextEditingController linkedInTextEd = TextEditingController();
  TextEditingController googleplusTextEd = TextEditingController();
  TextEditingController pintrestTextEd = TextEditingController();

  //Models
  DistrictModel stateData = DistrictModel();
  CityModel cityData = CityModel();

  
  @override
  void initState() {

    getMasterValues();
    stateValuesApi();
    updateValues();
    print("The Values ${widget.name} , ${widget.description}");
    super.initState();
  }

  void updateValues() {

    if(widget.country!.isNotEmpty){
      setState(() {
        countryValue = widget.country! ;
        countryIndex = widget.countryId! ;
      });
    }


    if(widget.state!.isNotEmpty){
      setState(() {
        stateValue = widget.state! ;
        stateIndex = widget.stateID! ;
      });
    }

    if(widget.city!.isNotEmpty){
      setState(() {
        cityValue = widget.city! ;
        cityIndex = widget.cityID! ;
      });
    }

    if(widget.industryId!.isNotEmpty){
      print('The Industry ID ${widget.industryId}');
      setState(() {
        industryIndex = widget.industryId;
      });
    }

    if(widget.industry!.isNotEmpty){
      print('The Industry Value of edit profile ${widget.industry}');
      setState(() {
        industryValue = widget.industry!;
      });
    }

    if(widget.ownership!.isNotEmpty){
      print('The Ownership edit profile ${widget.ownership}');
      setState(() {
        ownerShipValue = widget.ownership! ;
      });
    }

    if(widget.ownershipId!.isNotEmpty){
      setState(() {
        ownerShipIndex = widget.ownershipId!;
      });
    }

    if(widget.name!.isNotEmpty){
      setState(() {
        nameTextEd = TextEditingController(
          text: widget.name
        );
      });
    }

    if(widget.email!.isNotEmpty){
      setState(() {
        emailTextEd = TextEditingController(
          text: widget.email
        );
      });
    }

    if(widget.ceo!.isNotEmpty){
      setState(() {
        ceoNameTextEd = TextEditingController(
          text: widget.ceo
        );
      });
    }

    if(widget.noOfOffice!.isNotEmpty){
      setState(() {
        noOfOfiiceTextEd = TextEditingController(
          text: widget.noOfOffice
        );
      });
    }

    if(widget.noOfEmployees!.isNotEmpty){
      setState(() {
        noOfEmployeesTextEd = TextEditingController(
          text: widget.noOfEmployees
        );
      });
    }

    if(widget.websiteUrl!.isNotEmpty){
      setState(() {
        websiteUrlTextEd = TextEditingController(
          text: widget.websiteUrl
        );
      });
    }

    if(widget.fax!.isNotEmpty){
      setState(() {
        faxTextEd = TextEditingController(
          text: widget.fax
        );
      });
    }

    if(widget.establishedIn!.isNotEmpty){
      setState(() {
        establishedInTextEd = TextEditingController(
          text: widget.establishedIn
        );
      });
    }

    if(widget.noOfOffice!.isNotEmpty){
      setState(() {
        noOfOfiiceTextEd = TextEditingController(
          text: widget.noOfOffice
        );
      });
    }



    if(widget.address!.isNotEmpty){
      setState(() {
        addressTextEd = TextEditingController(
          text: widget.address
        );
      });
    }

    if(widget.phone!.isNotEmpty){
      setState(() {
        phoneTextEd = TextEditingController(
          text: widget.phone
        );
      });
    }

    if(widget.facebook!.isNotEmpty){
      setState(() {
        facebookTextEd = TextEditingController(
          text: widget.facebook
        );
      });
    }

    if(widget.twitter!.isNotEmpty){
      setState(() {
        twitterTextEd = TextEditingController(
          text: widget.twitter
        );
      });
    }

    if(widget.linkedIn!.isNotEmpty){
      setState(() {
        linkedInTextEd = TextEditingController(
          text: widget.linkedIn
        );
      });
    }

    if(widget.googlePlus!.isNotEmpty){
      setState(() {
        googleplusTextEd = TextEditingController(
          text: widget.googlePlus
        );
      });
    }

    if(widget.pintrest!.isNotEmpty){
      setState(() {
        pintrestTextEd = TextEditingController(
          text: widget.pintrest
        );
      });
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
  
  //Edit Profile Api without image uploading  
  Future<void> editProfileApi() async {

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(EDIT_PROFILE_API);
    http.Response response = await http.post(url ,
    body: {
      'name': nameTextEd.text ,
      'email': emailTextEd.text ,
      'ceo': ceoNameTextEd.text ,
      'industry_id': industryIndex == 0 ? "": industryIndex.toString(),
      'ownership_type_id': ownerShipIndex == 0 ? "": ownerShipIndex.toString(),
      'description': descriptionTextEd.text ,
      'location': addressTextEd.text ,
      'password': changePasswordTextEd.text ,
      'no_of_offices' : noOfOfiiceTextEd.text ,
      'no_of_employees': noOfEmployeesTextEd.text ,
      'established_in': establishedInTextEd.text ,
      'website': websiteUrlTextEd.text ,
      'fax': faxTextEd.text ,
      'phone': phoneTextEd.text ,
      'facebook': facebookTextEd.text ,
      'twitter': twitterTextEd.text ,
      'linkedin': linkedInTextEd.text ,
      'google_plus': googleplusTextEd.text ,
      'pinterest': pintrestTextEd.text ,
      'country_id': countryIndex.toString(),
      'state_id': stateIndex.toString(),
      'city_id': cityIndex.toString()
    },
    headers: {
      'Authorization': 'Bearer $token'
    });
    print('The response of edit profile ${response.body}');
    EditProfileModel data = EditProfileModel.fromJson(jsonDecode(response.body));

    if(data.status!){
      setState(() {
        isPressed = false ;
      });
      Navigator.pop(context);
      successSnackBar('Successfully updated Profile', context);
    }else{
      errorSnackBar('Something went wrong', context);
    }
  }

  //Edit Profile Api with Image
  Future<void> editProfileWithImage() async {
    print('Inside iMage upload Edit Profile');
    final prefs = await SharedPreferences.getInstance() ;
    var token = prefs.getString(USER_TOKEN);

    print('The User Image ${user_image!.path}');

    var url = Uri.parse(EDIT_PROFILE_API);
    var request = http.MultipartRequest('POST' , url);
    request.files.add(http.MultipartFile('logo' ,
        user_image!.readAsBytes().asStream() ,
        user_image!.lengthSync(),
        filename: user_image!.path.split('/').last));

    request.headers["authorization"] = 'Bearer $token' ;
    request.fields['name'] = nameTextEd.text ;
    request.fields['email'] = emailTextEd.text ;
    request.fields["ceo"] = ceoNameTextEd.text ;
    request.fields['description'] = descriptionTextEd.text ;
    request.fields['password'] = changePasswordTextEd.text ;
    request.fields["industry_id"] = industryIndex == 0 ? "": industryIndex.toString() ;
    request.fields["ownership_type_id"] = ownerShipIndex == 0 ? "": ownerShipIndex.toString() ;
    request.fields["location"] = addressTextEd.text;
    request.fields['no_of_offices'] = noOfOfiiceTextEd.text ;
    request.fields["no_of_employees"] = noOfEmployeesTextEd.text ;
    request.fields["established_in"] = establishedInTextEd.text ;
    request.fields["website"] = websiteUrlTextEd.text ;
    request.fields["fax"] = faxTextEd.text ;
    request.fields["phone"] = phoneTextEd.text ;
    request.fields["facebook"] = facebookTextEd.text ;
    request.fields["twitter"] = twitterTextEd.text ;
    request.fields["linkedin"] = linkedInTextEd.text ;
    request.fields["google_plus"] = googleplusTextEd.text ;
    request.fields["pinterest"] = pintrestTextEd.text ;
    request.fields["country_id"] = countryIndex.toString() ;
    request.fields["state_id"] = stateIndex.toString() ;
    request.fields["city_id"] = cityIndex.toString() ;

    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('The response of upload image ${response.body}');

    if(res.statusCode == 200){
      setState(() {
        isPressed = false ;
      });
      Navigator.pop(context);
      successSnackBar('Successfully updated Profile', context);
    }else{
      errorSnackBar('Something went wrong', context);
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
                            countryValue = data.countries![index].country! ;
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
                                stateValue = stateData.states![index].state! ;
                                stateIndex = stateData.states![index].stateId! ;
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
                                cityValue = cityData.cities![index].city! ;
                                cityIndex = cityData.cities![index].cityId! ;
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

  void ownerShipBottomSheet() {
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
                    child:  Text('Choose OwnerShip' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.ownertype!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                ownerShipValue = data.ownertype![index].ownershipType! ;
                                ownerShipIndex = data.ownertype![index].ownershipTypeId! ;
                              });
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.ownertype![index].ownershipType! ,
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

  void industryBottomSheet() {
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
                    child:  Text('Choose Industry' ,
                      style: TextStyle(
                          fontSize: 22 ,
                          fontWeight: FontWeight.w600
                      ),)),
                const SizedBox(height: 20,),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.industries!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                industryValue = data.industries![index].industry! ;
                                industryIndex = data.industries![index].industryId! ;
                              });
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 10,) ,
                                Text(data.industries![index].industry!,
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

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width ;

    return Consumer<InternetProvider>(
      builder: (context ,value,  child ) {
        return !value.isInternet ? InternetViewer():
        Scaffold(
          body: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0
            ),
            color: Colors.white,
            child: isLoading? const LoadingWidget():  ListView(
              children:  [
                const SizedBox(height : 30) ,
                 Align(
                  alignment: Alignment.topLeft,
                    child:  IconButton(
                      onPressed: ()=> Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back ,size: 25, ))) ,
                const Text('Edit Profile' ,
                style: TextStyle(
                  fontSize: 22 ,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),) ,

                const SizedBox(height: 30,) ,
                label('Company logo') ,

                const SizedBox(height: 15,) ,
                
                SizedBox(
                  height: 150,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: user_image == null ? Image.asset(NO_IMAGE_ICON ,height: 150, width: width,): 
                    Image.file(user_image! , height: 150, width: width,),
                  ),
                ),

                InkWell(
                  onTap: () async {
                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(image == null) return ;

                    setState(() {
                      user_image = File(image.path); 
                    });
                    print('The User Picked Image $user_image');
                  },
                  child: Container(
                    height: 45,
                    width: 165,
                    decoration: BoxDecoration(
                      color: APPCOLOR ,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Center(
                      child: Text('Pick an image' ,
                      style: TextStyle(
                        fontSize: 16 ,
                        color: Colors.white ,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                ),

                const SizedBox(height: 15,) ,
                label('Name') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: nameTextEd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Enter your name'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Email') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: emailTextEd,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your email'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Change Password') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: changePasswordTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your change password'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Ceo Name') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: ceoNameTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your ceo name'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Industry') ,
                const SizedBox(
                  height:  10 ,
                ),
                  InkWell(
                  onTap: (){
                    industryBottomSheet() ;
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
                      child: Text(industryValue ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            color: Colors.grey
                        ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Ownership') ,
                const SizedBox(
                  height:  10 ,
                ),
                InkWell(
                  onTap: () => ownerShipBottomSheet(),
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
                      child: Text(ownerShipValue ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            color: Colors.grey
                        ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Description') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: descriptionTextEd,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your description'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Address') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: addressTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your address Eg. land no , Street '
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('No of office') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: noOfOfiiceTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Type your no of office members Eg. 11-40'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('No of employees') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: noOfEmployeesTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your no of employees Eg. 11-50'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Established in') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: establishedInTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your established'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Website url') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: websiteUrlTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your website url Eg.www.google.com'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Fax') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: faxTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your fax number'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Phone') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: phoneTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your phone number'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Facebook') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: facebookTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your facebook name or profile url'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Twitter') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: twitterTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your twitter name or url'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('LinkedIn') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: linkedInTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your linkedin name or url'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Google plus+') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: googleplusTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your google plus name or url '
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Pinterest') ,
                const SizedBox(height: 10,) ,
                TextFormField(
                  controller: pintrestTextEd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Enter your pintrest name or url'
                  ),
                ),
                const SizedBox(height: 20,) ,

                label('Country') ,
                const SizedBox(
                  height: 10,
                ),
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
                      child: Text(countryValue ,
                      style: const TextStyle(
                        fontSize: 15 ,
                        color: Colors.grey
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,

                isIndia ? label('State') : Container(),
                 SizedBox(
                  height: isIndia?  10 : 0,
                ),
                !isIndia? Container():  InkWell(
                  onTap: () {
                    if(isIndia){
                      stateBottomSheet();
                    }else{
                      errorSnackBar('Please choose country', context);
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
                      child: Text(stateValue ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            color: Colors.grey
                        ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,

                isIndia? label('City'): Container() ,
                 SizedBox(
                  height: isIndia ? 10 : 0,
                ),
               !isIndia ? Container():  InkWell(
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
                      child: Text(cityValue ,
                        style: const TextStyle(
                            fontSize: 15 ,
                            color: Colors.grey
                        ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,

                InkWell(
                  onTap: () {

                    setState(() {
                      isPressed = true ;
                    });
                    if(user_image == null){
                      editProfileApi();
                    }else{
                      editProfileWithImage();
                    }

                  },
                  child: Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                      color: APPCOLOR ,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Center(
                      child: isPressed ? Lottie.asset(APP_LOADING , height: 35 , width: 55): const Text('Update' ,
                      style:  TextStyle(
                        fontSize: 15 ,
                        fontWeight: FontWeight.w600 ,
                        color: Colors.white
                      ),),
                    ),
                  ),
                )  ,

                const SizedBox(height: 30,)
              ],
            ),
          ),
        );
      }
    );
  }

  Widget label(String data) {
    return Text(data ,
    style: const TextStyle(
      fontSize: 17 ,
      fontWeight: FontWeight.w500
    ),);
  }
}
