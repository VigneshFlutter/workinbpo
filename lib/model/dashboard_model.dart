// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.status,
    this.openjobscount,
    this.followercount,
    this.msgcount,
    this.shortlistcount,
    this.jobApplications,
  });

  bool? status;
  int? openjobscount;
  int? followercount;
  int? msgcount;
  int? shortlistcount;
  List<JobApplication>? jobApplications;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    status: json["status"] == null ? null : json["status"],
    openjobscount: json["openjobscount"] == null ? null : json["openjobscount"],
    followercount: json["followercount"] == null ? null : json["followercount"],
    msgcount: json["msgcount"] == null ? null : json["msgcount"],
    shortlistcount: json["shortlistcount"] == null ? null : json["shortlistcount"],
    jobApplications: json["job_applications"] == null ? null : List<JobApplication>.from(json["job_applications"].map((x) => JobApplication.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "openjobscount": openjobscount == null ? null : openjobscount,
    "followercount": followercount == null ? null : followercount,
    "msgcount": msgcount == null ? null : msgcount,
    "shortlistcount": shortlistcount == null ? null : shortlistcount,
    "job_applications": jobApplications == null ? null : List<dynamic>.from(jobApplications!.map((x) => x.toJson())),
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
    this.job,
    this.user,
  });

  int? id;
  int? userId;
  int? jobId;
  int? cvId;
  int? currentSalary;
  int? expectedSalary;
  String? salaryCurrency;
  String? createdAt;
  String? updatedAt;
  Job? job;
  User? user;

  factory JobApplication.fromJson(Map<String, dynamic> json) => JobApplication(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    jobId: json["job_id"] == null ? null : json["job_id"],
    cvId: json["cv_id"] == null ? null : json["cv_id"],
    currentSalary: json["current_salary"] == null ? null : json["current_salary"],
    expectedSalary: json["expected_salary"] == null ? null : json["expected_salary"],
    salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "job_id": jobId == null ? null : jobId,
    "cv_id": cvId == null ? null : cvId,
    "current_salary": currentSalary == null ? null : currentSalary,
    "expected_salary": expectedSalary == null ? null : expectedSalary,
    "salary_currency": salaryCurrency == null ? null : salaryCurrency,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "job": job == null ? null : job!.toJson(),
    "user": user == null ? null : user!.toJson(),
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
  String? expiryDate;
  int? degreeLevelId;
  int? jobExperienceId;
  int? isActive;
  int? isFeatured;
  String? createdAt;
  String? updatedAt;
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
    expiryDate: json["expiry_date"] == null ? null : json["expiry_date"],
    degreeLevelId: json["degree_level_id"] == null ? null : json["degree_level_id"],
    jobExperienceId: json["job_experience_id"] == null ? null : json["job_experience_id"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
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
    "expiry_date": expiryDate == null ? null : expiryDate,
    "degree_level_id": degreeLevelId == null ? null : degreeLevelId,
    "job_experience_id": jobExperienceId == null ? null : jobExperienceId,
    "is_active": isActive == null ? null : isActive,
    "is_featured": isFeatured == null ? null : isFeatured,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "search": search == null ? null : search,
    "slug": slug == null ? null : slug,
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
  String? fatherName;
  String? dateOfBirth;
  dynamic genderId;
  dynamic maritalStatusId;
  dynamic nationalityId;
  String? nationalIdCardNumber;
  String? countryId;
  String? stateId;
  String? cityId;
  String? phone;
  String? mobileNum;
  dynamic jobExperienceId;
  dynamic careerLevelId;
  dynamic industryId;
  dynamic functionalAreaId;
  String? currentSalary;
  String? expectedSalary;
  String? salaryCurrency;
  String? streetAddress;
  int? isActive;
  int? verified;
  dynamic verificationToken;
  dynamic provider;
  dynamic providerId;
  String? image;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
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
  String? emailVerifiedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    fatherName: json["father_name"] == null ? null : json["father_name"],
    dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
    genderId: json["gender_id"] == null ? null : json["gender_id"],
    maritalStatusId: json["marital_status_id"] == null ? null : json["marital_status_id"],
    nationalityId: json["nationality_id"] == null ? null : json["nationality_id"],
    nationalIdCardNumber: json["national_id_card_number"] == null ? null : json["national_id_card_number"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    phone: json["phone"] == null ? null : json["phone"],
    mobileNum: json["mobile_num"] == null ? null : json["mobile_num"],
    jobExperienceId: json["job_experience_id"],
    careerLevelId: json["career_level_id"],
    industryId: json["industry_id"],
    functionalAreaId: json["functional_area_id"],
    currentSalary: json["current_salary"] == null ? null : json["current_salary"],
    expectedSalary: json["expected_salary"] == null ? null : json["expected_salary"],
    salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
    streetAddress: json["street_address"] == null ? null : json["street_address"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    verified: json["verified"] == null ? null : json["verified"],
    verificationToken: json["verification_token"],
    provider: json["provider"],
    providerId: json["provider_id"],
    image: json["image"] == null ? null : json["image"],
    lang: json["lang"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
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
    emailVerifiedAt: json["email_verified_at"] == null ? null : json["email_verified_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "middle_name": middleName == null ? null : middleName,
    "last_name": lastName == null ? null : lastName,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "father_name": fatherName == null ? null : fatherName,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
    "gender_id": genderId == null ? null : genderId,
    "marital_status_id": maritalStatusId == null ? null : maritalStatusId,
    "nationality_id": nationalityId == null ? null : nationalityId,
    "national_id_card_number": nationalIdCardNumber == null ? null : nationalIdCardNumber,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId == null ? null : stateId,
    "city_id": cityId == null ? null : cityId,
    "phone": phone == null ? null : phone,
    "mobile_num": mobileNum == null ? null : mobileNum,
    "job_experience_id": jobExperienceId,
    "career_level_id": careerLevelId,
    "industry_id": industryId,
    "functional_area_id": functionalAreaId,
    "current_salary": currentSalary == null ? null : currentSalary,
    "expected_salary": expectedSalary == null ? null : expectedSalary,
    "salary_currency": salaryCurrency == null ? null : salaryCurrency,
    "street_address": streetAddress == null ? null : streetAddress,
    "is_active": isActive == null ? null : isActive,
    "verified": verified == null ? null : verified,
    "verification_token": verificationToken,
    "provider": provider,
    "provider_id": providerId,
    "image": image == null ? null : image,
    "lang": lang,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
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
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt,
  };
}
