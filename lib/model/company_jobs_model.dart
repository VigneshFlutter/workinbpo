// To parse this JSON data, do
//
//     final companyJobsModel = companyJobsModelFromJson(jsonString);

import 'dart:convert';

CompanyJobsModel companyJobsModelFromJson(String str) => CompanyJobsModel.fromJson(json.decode(str));

String companyJobsModelToJson(CompanyJobsModel data) => json.encode(data.toJson());

class CompanyJobsModel {
  CompanyJobsModel({
    this.status,
    this.jobs,
  });

  bool? status;
  Jobs? jobs;

  factory CompanyJobsModel.fromJson(Map<String, dynamic> json) => CompanyJobsModel(
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
