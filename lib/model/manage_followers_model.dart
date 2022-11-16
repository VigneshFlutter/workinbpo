// To parse this JSON data, do
//
//     final manageFollowersModel = manageFollowersModelFromJson(jsonString);

import 'dart:convert';

ManageFollowersModel manageFollowersModelFromJson(String str) => ManageFollowersModel.fromJson(json.decode(str));

String manageFollowersModelToJson(ManageFollowersModel data) => json.encode(data.toJson());

class ManageFollowersModel {
  ManageFollowersModel({
    this.status,
    this.users,
    this.company,
  });

  bool? status;
  List<User>? users;
  Company? company;

  factory ManageFollowersModel.fromJson(Map<String, dynamic> json) => ManageFollowersModel(
    status: json["status"] == null ? null : json["status"],
    users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
    "company": company == null ? null : company!.toJson(),
  };
}

class Company {
  Company({
    this.id,
    this.name,
    this.email,
    this.ceo,
    this.industryId,
    this.ownershipTypeId,
    this.description,
    this.location,
    this.noOfOffices,
    this.website,
    this.noOfEmployees,
    this.establishedIn,
    this.fax,
    this.phone,
    this.logo,
    this.countryId,
    this.stateId,
    this.cityId,
    this.slug,
    this.isActive,
    this.isFeatured,
    this.verified,
    this.verificationToken,
    this.map,
    this.createdAt,
    this.updatedAt,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.googlePlus,
    this.pinterest,
    this.packageId,
    this.packageStartDate,
    this.packageEndDate,
    this.availFreepackage,
    this.jobsQuota,
    this.availedJobsQuota,
    this.isSubscribed,
    this.personalFirstName,
    this.personalLastName,
    this.personalContactNumber,
    this.companyEmail,
    this.emailVerifiedAt,
  });

  int? id;
  String? name;
  String? email;
  String? ceo;
  int? industryId;
  int? ownershipTypeId;
  String? description;
  String? location;
  int? noOfOffices;
  String? website;
  String? noOfEmployees;
  String? establishedIn;
  String? fax;
  String? phone;
  String? logo;
  int? countryId;
  int? stateId;
  int? cityId;
  String? slug;
  int? isActive;
  int? isFeatured;
  int? verified;
  dynamic verificationToken;
  dynamic map;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? facebook;
  dynamic twitter;
  dynamic linkedin;
  dynamic googlePlus;
  dynamic pinterest;
  int? packageId;
  DateTime? packageStartDate;
  DateTime? packageEndDate;
  int? availFreepackage;
  int? jobsQuota;
  int? availedJobsQuota;
  int? isSubscribed;
  dynamic personalFirstName;
  dynamic personalLastName;
  dynamic personalContactNumber;
  String? companyEmail;
  DateTime? emailVerifiedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    ceo: json["ceo"] == null ? null : json["ceo"],
    industryId: json["industry_id"] == null ? null : json["industry_id"],
    ownershipTypeId: json["ownership_type_id"] == null ? null : json["ownership_type_id"],
    description: json["description"] == null ? null : json["description"],
    location: json["location"] == null ? null : json["location"],
    noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
    website: json["website"] == null ? null : json["website"],
    noOfEmployees: json["no_of_employees"] == null ? null : json["no_of_employees"],
    establishedIn: json["established_in"] == null ? null : json["established_in"],
    fax: json["fax"] == null ? null : json["fax"],
    phone: json["phone"] == null ? null : json["phone"],
    logo: json["logo"] == null ? null : json["logo"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    slug: json["slug"] == null ? null : json["slug"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    verified: json["verified"] == null ? null : json["verified"],
    verificationToken: json["verification_token"],
    map: json["map"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    facebook: json["facebook"] == null ? null : json["facebook"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
    googlePlus: json["google_plus"],
    pinterest: json["pinterest"],
    packageId: json["package_id"] == null ? null : json["package_id"],
    packageStartDate: json["package_start_date"] == null ? null : DateTime.parse(json["package_start_date"]),
    packageEndDate: json["package_end_date"] == null ? null : DateTime.parse(json["package_end_date"]),
    availFreepackage: json["avail_freepackage"] == null ? null : json["avail_freepackage"],
    jobsQuota: json["jobs_quota"] == null ? null : json["jobs_quota"],
    availedJobsQuota: json["availed_jobs_quota"] == null ? null : json["availed_jobs_quota"],
    isSubscribed: json["is_subscribed"] == null ? null : json["is_subscribed"],
    personalFirstName: json["personal_first_name"],
    personalLastName: json["personal_last_name"],
    personalContactNumber: json["personal_contact_number"],
    companyEmail: json["company_email"] == null ? null : json["company_email"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "ceo": ceo == null ? null : ceo,
    "industry_id": industryId == null ? null : industryId,
    "ownership_type_id": ownershipTypeId == null ? null : ownershipTypeId,
    "description": description == null ? null : description,
    "location": location == null ? null : location,
    "no_of_offices": noOfOffices == null ? null : noOfOffices,
    "website": website == null ? null : website,
    "no_of_employees": noOfEmployees == null ? null : noOfEmployees,
    "established_in": establishedIn == null ? null : establishedIn,
    "fax": fax == null ? null : fax,
    "phone": phone == null ? null : phone,
    "logo": logo == null ? null : logo,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId == null ? null : stateId,
    "city_id": cityId == null ? null : cityId,
    "slug": slug == null ? null : slug,
    "is_active": isActive == null ? null : isActive,
    "is_featured": isFeatured == null ? null : isFeatured,
    "verified": verified == null ? null : verified,
    "verification_token": verificationToken,
    "map": map,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "facebook": facebook == null ? null : facebook,
    "twitter": twitter,
    "linkedin": linkedin,
    "google_plus": googlePlus,
    "pinterest": pinterest,
    "package_id": packageId == null ? null : packageId,
    "package_start_date": packageStartDate == null ? null : packageStartDate!.toIso8601String(),
    "package_end_date": packageEndDate == null ? null : packageEndDate!.toIso8601String(),
    "avail_freepackage": availFreepackage == null ? null : availFreepackage,
    "jobs_quota": jobsQuota == null ? null : jobsQuota,
    "availed_jobs_quota": availedJobsQuota == null ? null : availedJobsQuota,
    "is_subscribed": isSubscribed == null ? null : isSubscribed,
    "personal_first_name": personalFirstName,
    "personal_last_name": personalLastName,
    "personal_contact_number": personalContactNumber,
    "company_email": companyEmail == null ? null : companyEmail,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.name,
    this.email,
    this.fatherName,
    this.dateOfBirth,
    this.genderId,
    this.maritalStatusId,
    this.nationalityId,
    this.nationalIdCardNumber,
    this.countryId,
    this.stateId,
    this.cityId,
    this.phone,
    this.mobileNum,
    this.jobExperienceId,
    this.careerLevelId,
    this.industryId,
    this.functionalAreaId,
    this.currentSalary,
    this.expectedSalary,
    this.salaryCurrency,
    this.streetAddress,
    this.isActive,
    this.verified,
    this.verificationToken,
    this.provider,
    this.providerId,
    this.image,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.isImmediateAvailable,
    this.numProfileViews,
    this.packageId,
    this.packageStartDate,
    this.packageEndDate,
    this.availFreepackage,
    this.jobsQuota,
    this.availedJobsQuota,
    this.search,
    this.isSubscribed,
    this.fcmToken,
    this.emailVerifiedAt,
  });

  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? name;
  String? email;
  dynamic fatherName;
  DateTime? dateOfBirth;
  dynamic genderId;
  dynamic maritalStatusId;
  dynamic nationalityId;
  dynamic nationalIdCardNumber;
  String? countryId;
  dynamic stateId;
  dynamic cityId;
  String? phone;
  dynamic mobileNum;
  dynamic jobExperienceId;
  dynamic careerLevelId;
  dynamic industryId;
  dynamic functionalAreaId;
  dynamic currentSalary;
  dynamic expectedSalary;
  String? salaryCurrency;
  dynamic streetAddress;
  int? isActive;
  int? verified;
  dynamic verificationToken;
  dynamic provider;
  dynamic providerId;
  dynamic image;
  dynamic lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isImmediateAvailable;
  int? numProfileViews;
  int? packageId;
  dynamic packageStartDate;
  dynamic packageEndDate;
  int? availFreepackage;
  int? jobsQuota;
  int? availedJobsQuota;
  String? search;
  int? isSubscribed;
  dynamic fcmToken;
  DateTime? emailVerifiedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    fatherName: json["father_name"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    genderId: json["gender_id"],
    maritalStatusId: json["marital_status_id"],
    nationalityId: json["nationality_id"],
    nationalIdCardNumber: json["national_id_card_number"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    phone: json["phone"] == null ? null : json["phone"],
    mobileNum: json["mobile_num"],
    jobExperienceId: json["job_experience_id"],
    careerLevelId: json["career_level_id"],
    industryId: json["industry_id"],
    functionalAreaId: json["functional_area_id"],
    currentSalary: json["current_salary"],
    expectedSalary: json["expected_salary"],
    salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
    streetAddress: json["street_address"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    verified: json["verified"] == null ? null : json["verified"],
    verificationToken: json["verification_token"],
    provider: json["provider"],
    providerId: json["provider_id"],
    image: json["image"],
    lang: json["lang"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isImmediateAvailable: json["is_immediate_available"] == null ? null : json["is_immediate_available"],
    numProfileViews: json["num_profile_views"] == null ? null : json["num_profile_views"],
    packageId: json["package_id"] == null ? null : json["package_id"],
    packageStartDate: json["package_start_date"],
    packageEndDate: json["package_end_date"],
    availFreepackage: json["avail_freepackage"] == null ? null : json["avail_freepackage"],
    jobsQuota: json["jobs_quota"] == null ? null : json["jobs_quota"],
    availedJobsQuota: json["availed_jobs_quota"] == null ? null : json["availed_jobs_quota"],
    search: json["search"] == null ? null : json["search"],
    isSubscribed: json["is_subscribed"] == null ? null : json["is_subscribed"],
    fcmToken: json["fcm_token"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "middle_name": middleName == null ? null : middleName,
    "last_name": lastName == null ? null : lastName,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "father_name": fatherName,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth!.toIso8601String(),
    "gender_id": genderId,
    "marital_status_id": maritalStatusId,
    "nationality_id": nationalityId,
    "national_id_card_number": nationalIdCardNumber,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId,
    "city_id": cityId,
    "phone": phone == null ? null : phone,
    "mobile_num": mobileNum,
    "job_experience_id": jobExperienceId,
    "career_level_id": careerLevelId,
    "industry_id": industryId,
    "functional_area_id": functionalAreaId,
    "current_salary": currentSalary,
    "expected_salary": expectedSalary,
    "salary_currency": salaryCurrency == null ? null : salaryCurrency,
    "street_address": streetAddress,
    "is_active": isActive == null ? null : isActive,
    "verified": verified == null ? null : verified,
    "verification_token": verificationToken,
    "provider": provider,
    "provider_id": providerId,
    "image": image,
    "lang": lang,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "is_immediate_available": isImmediateAvailable == null ? null : isImmediateAvailable,
    "num_profile_views": numProfileViews == null ? null : numProfileViews,
    "package_id": packageId == null ? null : packageId,
    "package_start_date": packageStartDate,
    "package_end_date": packageEndDate,
    "avail_freepackage": availFreepackage == null ? null : availFreepackage,
    "jobs_quota": jobsQuota == null ? null : jobsQuota,
    "availed_jobs_quota": availedJobsQuota == null ? null : availedJobsQuota,
    "search": search == null ? null : search,
    "is_subscribed": isSubscribed == null ? null : isSubscribed,
    "fcm_token": fcmToken,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
  };
}
