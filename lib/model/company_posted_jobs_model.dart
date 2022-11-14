// To parse this JSON data, do
//
//     final companyPostedJobs = companyPostedJobsFromJson(jsonString);

import 'dart:convert';

CompanyPostedJobsModel companyPostedJobsFromJson(String str) => CompanyPostedJobsModel.fromJson(json.decode(str));

String companyPostedJobsToJson(CompanyPostedJobsModel data) => json.encode(data.toJson());

class CompanyPostedJobsModel {
  CompanyPostedJobsModel({
    this.status,
    this.jobs,
  });

  bool? status;
  Jobs? jobs;

  factory CompanyPostedJobsModel.fromJson(Map<String, dynamic> json) => CompanyPostedJobsModel(
    status: json["status"] == null ? null : json["status"],
    jobs: json["jobs"] == null ? null : Jobs.fromJson(json["jobs"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "jobs": jobs == null ? null : jobs!.toJson(),
  };
}

class Jobs {
  Jobs({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl == null ? null : firstPageUrl,
    "from": from == null ? null : from,
    "last_page": lastPage == null ? null : lastPage,
    "last_page_url": lastPageUrl == null ? null : lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path == null ? null : path,
    "per_page": perPage == null ? null : perPage,
    "prev_page_url": prevPageUrl,
    "to": to == null ? null : to,
    "total": total == null ? null : total,
  };
}

class Datum {
  Datum({
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
    this.company,
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
  Company? company;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
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

