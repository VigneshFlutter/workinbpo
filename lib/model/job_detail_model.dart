// To parse this JSON data, do
//
//     final jobDetailModel = jobDetailModelFromJson(jsonString);

import 'dart:convert';

JobDetailModel jobDetailModelFromJson(String str) => JobDetailModel.fromJson(json.decode(str));

String jobDetailModelToJson(JobDetailModel data) => json.encode(data.toJson());

class JobDetailModel {
  JobDetailModel({
    this.status,
    this.job,
    this.relatedJobs,
    this.seo,
  });

  bool? status;
  Job? job;
  List<dynamic>? relatedJobs;
  Seo? seo;

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => JobDetailModel(
    status: json["status"] == null ? null : json["status"],
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
    relatedJobs: json["relatedJobs"] == null ? null : List<dynamic>.from(json["relatedJobs"].map((x) => x)),
    seo: json["seo"] == null ? null : Seo.fromJson(json["seo"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "job": job == null ? null : job!.toJson(),
    "relatedJobs": relatedJobs == null ? null : List<dynamic>.from(relatedJobs!.map((x) => x)),
    "seo": seo == null ? null : seo!.toJson(),
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
    this.jobSkillIds,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.search,
    this.slug,
    this.countryIds,
    this.stateIds,
    this.cityIds,
    this.careerLevelIds,
    this.jobTypeIds,
    this.jobShiftIds,
    this.genderIds,
    this.degreeLevelIds,
    this.jobExperienceIds,
    this.isfavourite,
    this.company,
    this.locations,
    this.jobSkills,
    this.careerLevel,
    this.functionalArea,
    this.jobType,
    this.jobShift,
    this.salaryPeriod,
    this.gender,
    this.degreeLevel,
    this.jobExperience,
    this.isApplied,
  });

  int? id;
  int? companyId;
  String? title;
  String? description;
  dynamic benefits;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isFreelance;
  int? careerLevelId;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  List<String>? jobSkillIds;
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
  List<String>? countryIds;
  List<String>? stateIds;
  List<String>? cityIds;
  List<String>? careerLevelIds;
  List<String>? jobTypeIds;
  List<String>? jobShiftIds;
  List<String>? genderIds;
  List<String>? degreeLevelIds;
  List<String>? jobExperienceIds;
  dynamic isApplied;
  int? isfavourite;
  Company? company;
  Locations? locations;
  List<JobSkill>? jobSkills;
  CareerLevel? careerLevel;
  CareerLevel? functionalArea;
  CareerLevel? jobType;
  CareerLevel? jobShift;
  CareerLevel? salaryPeriod;
  CareerLevel? gender;
  CareerLevel? degreeLevel;
  CareerLevel? jobExperience;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"] == null ? null : json["id"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    benefits: json["benefits"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    isFreelance: json["is_freelance"] == null ? null : json["is_freelance"],
    jobSkillIds: json["job_skill_ids"] == null ? null : List<String>.from(json["job_skill_ids"].map((x) => x)),
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
    isApplied: json["is_applied"] == null ? null : json["is_applied"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    search: json["search"] == null ? null : json["search"],
    slug: json["slug"] == null ? null : json["slug"],
    countryIds: json["country_ids"] == null ? null : List<String>.from(json["country_ids"].map((x) => x)),
    stateIds: json["state_ids"] == null ? null : List<String>.from(json["state_ids"].map((x) => x)),
    cityIds: json["city_ids"] == null ? null : List<String>.from(json["city_ids"].map((x) => x)),
    careerLevelIds: json["career_level_ids"] == null ? null : List<String>.from(json["career_level_ids"].map((x) => x)),
    jobTypeIds: json["job_type_ids"] == null ? null : List<String>.from(json["job_type_ids"].map((x) => x)),
    jobShiftIds: json["job_shift_ids"] == null ? null : List<String>.from(json["job_shift_ids"].map((x) => x)),
    genderIds: json["gender_ids"] == null ? null : List<String>.from(json["gender_ids"].map((x) => x)),
    degreeLevelIds: json["degree_level_ids"] == null ? null : List<String>.from(json["degree_level_ids"].map((x) => x)),
    jobExperienceIds: json["job_experience_ids"] == null ? null : List<String>.from(json["job_experience_ids"].map((x) => x)),

    isfavourite: json["isfavourite"] == null ? null : json["isfavourite"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    locations: json["locations"] == null ? null : Locations.fromJson(json["locations"]),
    jobSkills: json["job_skills"] == null ? null : List<JobSkill>.from(json["job_skills"].map((x) => JobSkill.fromJson(x))),
    careerLevel: json["career_level"] == null ? null : CareerLevel.fromJson(json["career_level"]),
    functionalArea: json["functional_area"] == null ? null : CareerLevel.fromJson(json["functional_area"]),
    jobType: json["job_type"] == null ? null : CareerLevel.fromJson(json["job_type"]),
    jobShift: json["job_shift"] == null ? null : CareerLevel.fromJson(json["job_shift"]),
    salaryPeriod: json["salary_period"] == null ? null : CareerLevel.fromJson(json["salary_period"]),
    gender: json["gender"] == null ? null : CareerLevel.fromJson(json["gender"]),
    degreeLevel: json["degree_level"] == null ? null : CareerLevel.fromJson(json["degree_level"]),
    jobExperience: json["job_experience"] == null ? null : CareerLevel.fromJson(json["job_experience"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "company_id": companyId == null ? null : companyId,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "benefits": benefits,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId == null ? null : stateId,
    "city_id": cityId == null ? null : cityId,
    "is_freelance": isFreelance == null ? null : isFreelance,
    "career_level_id": careerLevelId == null ? null : careerLevelId,
    "salary_from": salaryFrom == null ? null : salaryFrom,
    "salary_to": salaryTo == null ? null : salaryTo,
    "job_skill_ids": jobSkillIds == null ? null : List<dynamic>.from(jobSkillIds!.map((x) => x)),
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
    "country_ids": countryIds == null ? null : List<dynamic>.from(countryIds!.map((x) => x)),
    "state_ids": stateIds == null ? null : List<dynamic>.from(stateIds!.map((x) => x)),
    "city_ids": cityIds == null ? null : List<dynamic>.from(cityIds!.map((x) => x)),
    "career_level_ids": careerLevelIds == null ? null : List<dynamic>.from(careerLevelIds!.map((x) => x)),
    "job_type_ids": jobTypeIds == null ? null : List<dynamic>.from(jobTypeIds!.map((x) => x)),
    "job_shift_ids": jobShiftIds == null ? null : List<dynamic>.from(jobShiftIds!.map((x) => x)),
    "gender_ids": genderIds == null ? null : List<dynamic>.from(genderIds!.map((x) => x)),
    "degree_level_ids": degreeLevelIds == null ? null : List<dynamic>.from(degreeLevelIds!.map((x) => x)),
    "job_experience_ids": jobExperienceIds == null ? null : List<dynamic>.from(jobExperienceIds!.map((x) => x)),
    "is_applied": isApplied == null ? null : isApplied,
    "isfavourite": isfavourite == null ? null : isfavourite,
    "company": company == null ? null : company!.toJson(),
    "locations": locations == null ? null : locations!.toJson(),
    "job_skills": jobSkills == null ? null : List<dynamic>.from(jobSkills!.map((x) => x.toJson())),
    "career_level": careerLevel == null ? null : careerLevel!.toJson(),
    "functional_area": functionalArea == null ? null : functionalArea!.toJson(),
    "job_type": jobType == null ? null : jobType!.toJson(),
    "job_shift": jobShift == null ? null : jobShift!.toJson(),
    "salary_period": salaryPeriod == null ? null : salaryPeriod!.toJson(),
    "gender": gender == null ? null : gender!.toJson(),
    "degree_level": degreeLevel == null ? null : degreeLevel!.toJson(),
    "job_experience": jobExperience == null ? null : jobExperience!.toJson(),
  };
}

class CareerLevel {
  CareerLevel({
    this.id,
    this.careerLevelId,
    this.careerLevel,
    this.isDefault,
    this.isActive,
    this.sortOrder,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.degreeLevelId,
    this.degreeLevel,
    this.functionalAreaId,
    this.functionalArea,
    this.genderId,
    this.gender,
    this.jobExperienceId,
    this.jobExperience,
    this.jobShiftId,
    this.jobShift,
    this.jobTypeId,
    this.jobType,
    this.salaryPeriodId,
    this.salaryPeriod,
  });

  int? id;
  int? careerLevelId;
  String? careerLevel;
  int? isDefault;
  int? isActive;
  int ?sortOrder;
  String? lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? degreeLevelId;
  String? degreeLevel;
  int? functionalAreaId;
  String? functionalArea;
  int? genderId;
  String? gender;
  int? jobExperienceId;
  String? jobExperience;
  int? jobShiftId;
  String? jobShift;
  int? jobTypeId;
  String? jobType;
  int? salaryPeriodId;
  String? salaryPeriod;

  factory CareerLevel.fromJson(Map<String, dynamic> json) => CareerLevel(
    id: json["id"] == null ? null : json["id"],
    careerLevelId: json["career_level_id"] == null ? null : json["career_level_id"],
    careerLevel: json["career_level"] == null ? null : json["career_level"],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    lang: json["lang"] == null ? null : json["lang"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    degreeLevelId: json["degree_level_id"] == null ? null : json["degree_level_id"],
    degreeLevel: json["degree_level"] == null ? null : json["degree_level"],
    functionalAreaId: json["functional_area_id"] == null ? null : json["functional_area_id"],
    functionalArea: json["functional_area"] == null ? null : json["functional_area"],
    genderId: json["gender_id"] == null ? null : json["gender_id"],
    gender: json["gender"] == null ? null : json["gender"],
    jobExperienceId: json["job_experience_id"] == null ? null : json["job_experience_id"],
    jobExperience: json["job_experience"] == null ? null : json["job_experience"],
    jobShiftId: json["job_shift_id"] == null ? null : json["job_shift_id"],
    jobShift: json["job_shift"] == null ? null : json["job_shift"],
    jobTypeId: json["job_type_id"] == null ? null : json["job_type_id"],
    jobType: json["job_type"] == null ? null : json["job_type"],
    salaryPeriodId: json["salary_period_id"] == null ? null : json["salary_period_id"],
    salaryPeriod: json["salary_period"] == null ? null : json["salary_period"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "career_level_id": careerLevelId == null ? null : careerLevelId,
    "career_level": careerLevel == null ? null : careerLevel,
    "is_default": isDefault == null ? null : isDefault,
    "is_active": isActive == null ? null : isActive,
    "sort_order": sortOrder == null ? null : sortOrder,
    "lang": lang == null ? null : lang,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "degree_level_id": degreeLevelId == null ? null : degreeLevelId,
    "degree_level": degreeLevel == null ? null : degreeLevel,
    "functional_area_id": functionalAreaId == null ? null : functionalAreaId,
    "functional_area": functionalArea == null ? null : functionalArea,
    "gender_id": genderId == null ? null : genderId,
    "gender": gender == null ? null : gender,
    "job_experience_id": jobExperienceId == null ? null : jobExperienceId,
    "job_experience": jobExperience == null ? null : jobExperience,
    "job_shift_id": jobShiftId == null ? null : jobShiftId,
    "job_shift": jobShift == null ? null : jobShift,
    "job_type_id": jobTypeId == null ? null : jobTypeId,
    "job_type": jobType == null ? null : jobType,
    "salary_period_id": salaryPeriodId == null ? null : salaryPeriodId,
    "salary_period": salaryPeriod == null ? null : salaryPeriod,
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
  String? description;
  String? location;
  int? noOfOffices;
  String? website;
  dynamic noOfEmployees;
  String? establishedIn;
  dynamic fax;
  String? phone;
  String? logo;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
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
  int? jobsQuota;
  int? availedJobsQuota;
  int? isSubscribed;
  String? personalFirstName;
  String? personalLastName;
  String? personalContactNumber;
  String? companyEmail;
  DateTime? emailVerifiedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    ceo: json["ceo"],
    industryId: json["industry_id"],
    ownershipTypeId: json["ownership_type_id"],
    description: json["description"] == null ? null : json["description"],
    location: json["location"] == null ? null : json["location"],
    noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
    website: json["website"] == null ? null : json["website"],
    noOfEmployees: json["no_of_employees"],
    establishedIn: json["established_in"] == null ? null : json["established_in"],
    fax: json["fax"],
    phone: json["phone"] == null ? null : json["phone"],
    logo: json["logo"] == null ? null : json["logo"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
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
    jobsQuota: json["jobs_quota"] == null ? null : json["jobs_quota"],
    availedJobsQuota: json["availed_jobs_quota"] == null ? null : json["availed_jobs_quota"],
    isSubscribed: json["is_subscribed"] == null ? null : json["is_subscribed"],
    personalFirstName: json["personal_first_name"] == null ? null : json["personal_first_name"],
    personalLastName: json["personal_last_name"] == null ? null : json["personal_last_name"],
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
    "description": description == null ? null : description,
    "location": location == null ? null : location,
    "no_of_offices": noOfOffices == null ? null : noOfOffices,
    "website": website == null ? null : website,
    "no_of_employees": noOfEmployees,
    "established_in": establishedIn == null ? null : establishedIn,
    "fax": fax,
    "phone": phone == null ? null : phone,
    "logo": logo == null ? null : logo,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
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
    "jobs_quota": jobsQuota == null ? null : jobsQuota,
    "availed_jobs_quota": availedJobsQuota == null ? null : availedJobsQuota,
    "is_subscribed": isSubscribed == null ? null : isSubscribed,
    "personal_first_name": personalFirstName == null ? null : personalFirstName,
    "personal_last_name": personalLastName == null ? null : personalLastName,
    "personal_contact_number": personalContactNumber == null ? null : personalContactNumber,
    "company_email": companyEmail == null ? null : companyEmail,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
  };
}

class JobSkill {
  JobSkill({
    this.id,
    this.jobId,
    this.jobSkillId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? jobId;
  int? jobSkillId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory JobSkill.fromJson(Map<String, dynamic> json) => JobSkill(
    id: json["id"] == null ? null : json["id"],
    jobId: json["job_id"] == null ? null : json["job_id"],
    jobSkillId: json["job_skill_id"] == null ? null : json["job_skill_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "job_id": jobId == null ? null : jobId,
    "job_skill_id": jobSkillId == null ? null : jobSkillId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Locations {
  Locations({
    this.id,
    this.cityId,
    this.city,
    this.stateId,
    this.isDefault,
    this.isActive,
    this.sortOrder,
    this.lang,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? cityId;
  String? city;
  int? stateId;
  int? isDefault;
  int? isActive;
  int? sortOrder;
  String? lang;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    id: json["id"] == null ? null : json["id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    city: json["city"] == null ? null : json["city"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    lang: json["lang"] == null ? null : json["lang"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "city_id": cityId == null ? null : cityId,
    "city": city == null ? null : city,
    "state_id": stateId == null ? null : stateId,
    "is_default": isDefault == null ? null : isDefault,
    "is_active": isActive == null ? null : isActive,
    "sort_order": sortOrder == null ? null : sortOrder,
    "lang": lang == null ? null : lang,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Seo {
  Seo({
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoOther,
  });

  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? seoOther;

  factory Seo.fromJson(Map<String, dynamic> json) => Seo(
    seoTitle: json["seo_title"] == null ? null : json["seo_title"],
    seoDescription: json["seo_description"] == null ? null : json["seo_description"],
    seoKeywords: json["seo_keywords"] == null ? null : json["seo_keywords"],
    seoOther: json["seo_other"] == null ? null : json["seo_other"],
  );

  Map<String, dynamic> toJson() => {
    "seo_title": seoTitle == null ? null : seoTitle,
    "seo_description": seoDescription == null ? null : seoDescription,
    "seo_keywords": seoKeywords == null ? null : seoKeywords,
    "seo_other": seoOther == null ? null : seoOther,
  };
}
