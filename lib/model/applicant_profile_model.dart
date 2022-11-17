// To parse this JSON data, do
//
//     final applicantProfileModel = applicantProfileModelFromJson(jsonString);

import 'dart:convert';

ApplicantProfileModel applicantProfileModelFromJson(String str) => ApplicantProfileModel.fromJson(json.decode(str));

String applicantProfileModelToJson(ApplicantProfileModel data) => json.encode(data.toJson());

class ApplicantProfileModel {
  ApplicantProfileModel({
    this.status,
    this.jobApplication,
    this.user,
    this.job,
    this.company,
    this.profileCv,
    this.testing,
  });

  bool? status;
  JobApplication? jobApplication;
  User? user;
  Job? job;
  Company? company;
  ProfileCv? profileCv;
  String? testing;

  factory ApplicantProfileModel.fromJson(Map<String, dynamic> json) => ApplicantProfileModel(
    status: json["status"] == null ? null : json["status"],
    jobApplication: json["job_application"] == null ? null : JobApplication.fromJson(json["job_application"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    profileCv: json["profileCv"] == null ? null : ProfileCv.fromJson(json["profileCv"]),
    testing: json["testing"] == null ? null : json["testing"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "job_application": jobApplication == null ? null : jobApplication!.toJson(),
    "user": user == null ? null : user!.toJson(),
    "job": job == null ? null : job!.toJson(),
    "company": company == null ? null : company!.toJson(),
    "profileCv": profileCv == null ? null : profileCv!.toJson(),
    "testing": testing == null ? null : testing,
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
  dynamic ceo;
  dynamic industryId;
  dynamic ownershipTypeId;
  dynamic description;
  dynamic location;
  int? noOfOffices;
  String? website;
  dynamic noOfEmployees;
  dynamic establishedIn;
  dynamic fax;
  String? phone;
  dynamic logo;
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
  dynamic facebook;
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
  int? personalContactNumber;
  String? companyEmail;
  DateTime? emailVerifiedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    ceo: json["ceo"],
    industryId: json["industry_id"],
    ownershipTypeId: json["ownership_type_id"],
    description: json["description"],
    location: json["location"],
    noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
    website: json["website"] == null ? null : json["website"],
    noOfEmployees: json["no_of_employees"],
    establishedIn: json["established_in"],
    fax: json["fax"],
    phone: json["phone"] == null ? null : json["phone"],
    logo: json["logo"],
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
    facebook: json["facebook"],
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
    personalContactNumber: json["personal_contact_number"] == null ? null : json["personal_contact_number"],
    companyEmail: json["company_email"] == null ? null : json["company_email"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "ceo": ceo,
    "industry_id": industryId,
    "ownership_type_id": ownershipTypeId,
    "description": description,
    "location": location,
    "no_of_offices": noOfOffices == null ? null : noOfOffices,
    "website": website == null ? null : website,
    "no_of_employees": noOfEmployees,
    "established_in": establishedIn,
    "fax": fax,
    "phone": phone == null ? null : phone,
    "logo": logo,
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
    "facebook": facebook,
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
    "personal_contact_number": personalContactNumber == null ? null : personalContactNumber,
    "company_email": companyEmail == null ? null : companyEmail,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
  };
}

class Job {
  Job({
    this.id,
    this.companyId,
    this.title,
    this.description,
    this.benefits,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isFreelance,
    this.careerLevelId,
    this.salaryFrom,
    this.salaryTo,
    this.hideSalary,
    this.salaryCurrency,
    this.salaryPeriodId,
    this.functionalAreaId,
    this.jobTypeId,
    this.jobShiftId,
    this.numOfPositions,
    this.genderId,
    this.expiryDate,
    this.degreeLevelId,
    this.jobExperienceId,
    this.isActive,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.search,
    this.slug,
  });

  int? id;
  int? companyId;
  String? title;
  String? description;
  String? benefits;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isFreelance;
  int? careerLevelId;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  String? salaryCurrency;
  int? salaryPeriodId;
  int? functionalAreaId;
  int? jobTypeId;
  int? jobShiftId;
  int? numOfPositions;
  int? genderId;
  DateTime? expiryDate;
  int? degreeLevelId;
  int? jobExperienceId;
  int? isActive;
  int? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? search;
  String? slug;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"] == null ? null : json["id"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    benefits: json["benefits"] == null ? null : json["benefits"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    isFreelance: json["is_freelance"] == null ? null : json["is_freelance"],
    careerLevelId: json["career_level_id"] == null ? null : json["career_level_id"],
    salaryFrom: json["salary_from"] == null ? null : json["salary_from"],
    salaryTo: json["salary_to"] == null ? null : json["salary_to"],
    hideSalary: json["hide_salary"] == null ? null : json["hide_salary"],
    salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
    salaryPeriodId: json["salary_period_id"] == null ? null : json["salary_period_id"],
    functionalAreaId: json["functional_area_id"] == null ? null : json["functional_area_id"],
    jobTypeId: json["job_type_id"] == null ? null : json["job_type_id"],
    jobShiftId: json["job_shift_id"] == null ? null : json["job_shift_id"],
    numOfPositions: json["num_of_positions"] == null ? null : json["num_of_positions"],
    genderId: json["gender_id"] == null ? null : json["gender_id"],
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    degreeLevelId: json["degree_level_id"] == null ? null : json["degree_level_id"],
    jobExperienceId: json["job_experience_id"] == null ? null : json["job_experience_id"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    search: json["search"] == null ? null : json["search"],
    slug: json["slug"] == null ? null : json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "company_id": companyId == null ? null : companyId,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "benefits": benefits == null ? null : benefits,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId == null ? null : stateId,
    "city_id": cityId == null ? null : cityId,
    "is_freelance": isFreelance == null ? null : isFreelance,
    "career_level_id": careerLevelId == null ? null : careerLevelId,
    "salary_from": salaryFrom == null ? null : salaryFrom,
    "salary_to": salaryTo == null ? null : salaryTo,
    "hide_salary": hideSalary == null ? null : hideSalary,
    "salary_currency": salaryCurrency == null ? null : salaryCurrency,
    "salary_period_id": salaryPeriodId == null ? null : salaryPeriodId,
    "functional_area_id": functionalAreaId == null ? null : functionalAreaId,
    "job_type_id": jobTypeId == null ? null : jobTypeId,
    "job_shift_id": jobShiftId == null ? null : jobShiftId,
    "num_of_positions": numOfPositions == null ? null : numOfPositions,
    "gender_id": genderId == null ? null : genderId,
    "expiry_date": expiryDate == null ? null : expiryDate!.toIso8601String(),
    "degree_level_id": degreeLevelId == null ? null : degreeLevelId,
    "job_experience_id": jobExperienceId == null ? null : jobExperienceId,
    "is_active": isActive == null ? null : isActive,
    "is_featured": isFeatured == null ? null : isFeatured,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "search": search == null ? null : search,
    "slug": slug == null ? null : slug,
  };
}

class JobApplication {
  JobApplication({
    this.id,
    this.userId,
    this.jobId,
    this.cvId,
    this.currentSalary,
    this.expectedSalary,
    this.salaryCurrency,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? jobId;
  int? cvId;
  int? currentSalary;
  int? expectedSalary;
  String? salaryCurrency;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory JobApplication.fromJson(Map<String, dynamic> json) => JobApplication(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    jobId: json["job_id"] == null ? null : json["job_id"],
    cvId: json["cv_id"] == null ? null : json["cv_id"],
    currentSalary: json["current_salary"] == null ? null : json["current_salary"],
    expectedSalary: json["expected_salary"] == null ? null : json["expected_salary"],
    salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "job_id": jobId == null ? null : jobId,
    "cv_id": cvId == null ? null : cvId,
    "current_salary": currentSalary == null ? null : currentSalary,
    "expected_salary": expectedSalary == null ? null : expectedSalary,
    "salary_currency": salaryCurrency == null ? null : salaryCurrency,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class ProfileCv {
  ProfileCv({
    this.id,
    this.userId,
    this.title,
    this.cvFile,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? title;
  String? cvFile;
  int? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProfileCv.fromJson(Map<String, dynamic> json) => ProfileCv(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    title: json["title"] == null ? null : json["title"],
    cvFile: json["cv_file"] == null ? null : json["cv_file"],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "title": title == null ? null : title,
    "cv_file": cvFile == null ? null : cvFile,
    "is_default": isDefault == null ? null : isDefault,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
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
  dynamic dateOfBirth;
  dynamic genderId;
  dynamic maritalStatusId;
  dynamic nationalityId;
  dynamic nationalIdCardNumber;
  dynamic countryId;
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
  dynamic salaryCurrency;
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
  dynamic search;
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
    dateOfBirth: json["date_of_birth"],
    genderId: json["gender_id"],
    maritalStatusId: json["marital_status_id"],
    nationalityId: json["nationality_id"],
    nationalIdCardNumber: json["national_id_card_number"],
    countryId: json["country_id"],
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
    salaryCurrency: json["salary_currency"],
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
    search: json["search"],
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
    "date_of_birth": dateOfBirth,
    "gender_id": genderId,
    "marital_status_id": maritalStatusId,
    "nationality_id": nationalityId,
    "national_id_card_number": nationalIdCardNumber,
    "country_id": countryId,
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
    "salary_currency": salaryCurrency,
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
    "search": search,
    "is_subscribed": isSubscribed == null ? null : isSubscribed,
    "fcm_token": fcmToken,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
  };
}
