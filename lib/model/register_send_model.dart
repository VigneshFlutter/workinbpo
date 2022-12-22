class RegisterSendModel {
  String firstName ; 
  String lastName ; 
  String userMobile ; 
  String userEmail ; 
  String password ; 
  String companyName ; 
  String companyEmail ; 
  String numberofOffices ; 
  String establishedIn ; 
  String description; 
  String companyLocation ;
  String companyPhone ; 


  RegisterSendModel({
    required this.firstName , 
    required this.lastName , 
    required this.userMobile , 
    required this.userEmail , 
    required this.password , 
    required this.companyName , 
    required this.companyEmail , 
    required this.companyLocation , 
    required this.companyPhone , 
    required this.numberofOffices , 
    required this.establishedIn , 
    required this.description
  });
}