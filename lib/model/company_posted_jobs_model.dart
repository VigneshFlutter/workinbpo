// To parse this JSON data, do
//
//     final companyPostedJobsModel = companyPostedJobsModelFromJson(jsonString);

import 'dart:convert';

CompanyPostedJobsModel companyPostedJobsModelFromJson(String str) => CompanyPostedJobsModel.fromJson(json.decode(str));

String companyPostedJobsModelToJson(CompanyPostedJobsModel data) => json.encode(data.toJson());

class CompanyPostedJobsModel {
    CompanyPostedJobsModel({
        this.status,
        this.jobs,
        this.currentPackage,
        this.packageLeft,
        this.completedJob,
        this.completedJobCount,
    });

    bool? status;
    Jobs? jobs;
    List<dynamic>? currentPackage;
    List<PackageLeft>? packageLeft;
    List<CompletedJob>? completedJob;
    int? completedJobCount;

    factory CompanyPostedJobsModel.fromJson(Map<String, dynamic> json) => CompanyPostedJobsModel(
        status: json["status"] == null ? null : json["status"],
        jobs: json["jobs"] == null ? null : Jobs.fromJson(json["jobs"]),
        currentPackage: json["current_package"] == null ? null : List<dynamic>.from(json["current_package"].map((x) => x)),
        packageLeft: json["package_left"] == null ? null : List<PackageLeft>.from(json["package_left"].map((x) => PackageLeft.fromJson(x))),
        completedJob: json["completed_job"] == null ? null : List<CompletedJob>.from(json["completed_job"].map((x) => CompletedJob.fromJson(x))),
        completedJobCount: json["completed_job_count"] == null ? null : json["completed_job_count"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "jobs": jobs == null ? null : jobs!.toJson(),
        "current_package": currentPackage == null ? null : List<dynamic>.from(currentPackage!.map((x) => x)),
        "package_left": packageLeft == null ? null : List<dynamic>.from(packageLeft!.map((x) => x.toJson())),
        "completed_job": completedJob == null ? null : List<dynamic>.from(completedJob!.map((x) => x.toJson())),
        "completed_job_count": completedJobCount == null ? null : completedJobCount,
    };
}

class CompletedJob {
    CompletedJob({
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
    dynamic numOfPositions;
    int? genderId;
    DateTime? expiryDate;
    int? degreeLevelId;
    int? jobExperienceId;
    int? isActive;
    int? isFeatured;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic search;
    String? slug;

    factory CompletedJob.fromJson(Map<String, dynamic> json) => CompletedJob(
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
        numOfPositions: json["num_of_positions"],
        genderId: json["gender_id"] == null ? null : json["gender_id"],
        expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
        degreeLevelId: json["degree_level_id"] == null ? null : json["degree_level_id"],
        jobExperienceId: json["job_experience_id"] == null ? null : json["job_experience_id"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        isFeatured: json["is_featured"] == null ? null : json["is_featured"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        search: json["search"],
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
        "num_of_positions": numOfPositions,
        "gender_id": genderId == null ? null : genderId,
        "expiry_date": expiryDate == null ? null : expiryDate!.toIso8601String(),
        "degree_level_id": degreeLevelId == null ? null : degreeLevelId,
        "job_experience_id": jobExperienceId == null ? null : jobExperienceId,
        "is_active": isActive == null ? null : isActive,
        "is_featured": isFeatured == null ? null : isFeatured,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "search": search,
        "slug": slug == null ? null : slug,
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
        this.jobSkills,
        this.company,
    });

    int? id;
    Company? companyId;
    String? title;
    String? description;
    String? benefits;
    Id? countryId;
    Id? stateId;
    CityId? cityId;
    int? isFreelance;
    CareerLevelId? careerLevelId;
    int? salaryFrom;
    int? salaryTo;
    int? hideSalary;
    String? salaryCurrency;
    CareerLevelId? salaryPeriodId;
    CareerLevelId? functionalAreaId;
    CareerLevelId? jobTypeId;
    CareerLevelId? jobShiftId;
    dynamic numOfPositions;
    CareerLevelId? genderId;
    DateTime? expiryDate;
    CareerLevelId? degreeLevelId;
    CareerLevelId? jobExperienceId;
    int? isActive;
    int? isFeatured;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic search;
    String? slug;
    List<JobSkill>? jobSkills;
    Company? company;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        companyId: json["company_id"] == null ? null : Company.fromJson(json["company_id"]),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        benefits: json["benefits"] == null ? null : json["benefits"],
        countryId: json["country_id"] == null ? null : Id.fromJson(json["country_id"]),
        stateId: json["state_id"] == null ? null : Id.fromJson(json["state_id"]),
        cityId: json["city_id"] == null ? null : CityId.fromJson(json["city_id"]),
        isFreelance: json["is_freelance"] == null ? null : json["is_freelance"],
        careerLevelId: json["career_level_id"] == null ? null : CareerLevelId.fromJson(json["career_level_id"]),
        salaryFrom: json["salary_from"] == null ? null : json["salary_from"],
        salaryTo: json["salary_to"] == null ? null : json["salary_to"],
        hideSalary: json["hide_salary"] == null ? null : json["hide_salary"],
        salaryCurrency: json["salary_currency"] == null ? null : json["salary_currency"],
        salaryPeriodId: json["salary_period_id"] == null ? null : CareerLevelId.fromJson(json["salary_period_id"]),
        functionalAreaId: json["functional_area_id"] == null ? null : CareerLevelId.fromJson(json["functional_area_id"]),
        jobTypeId: json["job_type_id"] == null ? null : CareerLevelId.fromJson(json["job_type_id"]),
        jobShiftId: json["job_shift_id"] == null ? null : CareerLevelId.fromJson(json["job_shift_id"]),
        numOfPositions: json["num_of_positions"],
        genderId: json["gender_id"] == null ? null : CareerLevelId.fromJson(json["gender_id"]),
        expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
        degreeLevelId: json["degree_level_id"] == null ? null : CareerLevelId.fromJson(json["degree_level_id"]),
        jobExperienceId: json["job_experience_id"] == null ? null : CareerLevelId.fromJson(json["job_experience_id"]),
        isActive: json["is_active"] == null ? null : json["is_active"],
        isFeatured: json["is_featured"] == null ? null : json["is_featured"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        search: json["search"],
        slug: json["slug"] == null ? null : json["slug"],
        jobSkills: json["job_skills"] == null ? null : List<JobSkill>.from(json["job_skills"].map((x) => JobSkill.fromJson(x))),
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company_id": companyId == null ? null : companyId!.toJson(),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "benefits": benefits == null ? null : benefits,
        "country_id": countryId == null ? null : countryId!.toJson(),
        "state_id": stateId == null ? null : stateId!.toJson(),
        "city_id": cityId == null ? null : cityId!.toJson(),
        "is_freelance": isFreelance == null ? null : isFreelance,
        "career_level_id": careerLevelId == null ? null : careerLevelId!.toJson(),
        "salary_from": salaryFrom == null ? null : salaryFrom,
        "salary_to": salaryTo == null ? null : salaryTo,
        "hide_salary": hideSalary == null ? null : hideSalary,
        "salary_currency": salaryCurrency == null ? null : salaryCurrency,
        "salary_period_id": salaryPeriodId == null ? null : salaryPeriodId!.toJson(),
        "functional_area_id": functionalAreaId == null ? null : functionalAreaId!.toJson(),
        "job_type_id": jobTypeId == null ? null : jobTypeId!.toJson(),
        "job_shift_id": jobShiftId == null ? null : jobShiftId!.toJson(),
        "num_of_positions": numOfPositions,
        "gender_id": genderId == null ? null : genderId!.toJson(),
        "expiry_date": expiryDate == null ? null : expiryDate!.toIso8601String(),
        "degree_level_id": degreeLevelId == null ? null : degreeLevelId!.toJson(),
        "job_experience_id": jobExperienceId == null ? null : jobExperienceId!.toJson(),
        "is_active": isActive == null ? null : isActive,
        "is_featured": isFeatured == null ? null : isFeatured,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "search": search,
        "slug": slug == null ? null : slug,
        "job_skills": jobSkills == null ? null : List<dynamic>.from(jobSkills!.map((x) => x.toJson())),
        "company": company == null ? null : company!.toJson(),
    };
}

class CareerLevelId {
    CareerLevelId({
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
        this.jobSkillId,
        this.jobSkill,
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
    int? sortOrder;
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
    int? jobSkillId;
    String? jobSkill;
    int? jobTypeId;
    String? jobType;
    int? salaryPeriodId;
    String? salaryPeriod;

    factory CareerLevelId.fromJson(Map<String, dynamic> json) => CareerLevelId(
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
        jobSkillId: json["job_skill_id"] == null ? null : json["job_skill_id"],
        jobSkill: json["job_skill"] == null ? null : json["job_skill"],
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
        "job_skill_id": jobSkillId == null ? null : jobSkillId,
        "job_skill": jobSkill == null ? null : jobSkill,
        "job_type_id": jobTypeId == null ? null : jobTypeId,
        "job_type": jobType == null ? null : jobType,
        "salary_period_id": salaryPeriodId == null ? null : salaryPeriodId,
        "salary_period": salaryPeriod == null ? null : salaryPeriod,
    };
}

class CityId {
    CityId({
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

    factory CityId.fromJson(Map<String, dynamic> json) => CityId(
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
        this.availFreepackage,
    });

    int? id;
    String? name;
    String? email;
    dynamic ceo;
    int? industryId;
    int? ownershipTypeId;
    String? description;
    String? location;
    int? noOfOffices;
    dynamic website;
    dynamic noOfEmployees;
    String? establishedIn;
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
    String? verificationToken;
    dynamic map;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic facebook;
    dynamic twitter;
    dynamic linkedin;
    dynamic googlePlus;
    dynamic pinterest;
    int? packageId;
    dynamic packageStartDate;
    dynamic packageEndDate;
    int? jobsQuota;
    int? availedJobsQuota;
    int? isSubscribed;
    String? personalFirstName;
    String? personalLastName;
    String? personalContactNumber;
    String? companyEmail;
    dynamic emailVerifiedAt;
    int? availFreepackage;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        ceo: json["ceo"],
        industryId: json["industry_id"] == null ? null : json["industry_id"],
        ownershipTypeId: json["ownership_type_id"] == null ? null : json["ownership_type_id"],
        description: json["description"] == null ? null : json["description"],
        location: json["location"] == null ? null : json["location"],
        noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
        website: json["website"],
        noOfEmployees: json["no_of_employees"],
        establishedIn: json["established_in"] == null ? null : json["established_in"],
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
        verificationToken: json["verification_token"] == null ? null : json["verification_token"],
        map: json["map"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        googlePlus: json["google_plus"],
        pinterest: json["pinterest"],
        packageId: json["package_id"] == null ? null : json["package_id"],
        packageStartDate: json["package_start_date"],
        packageEndDate: json["package_end_date"],
        jobsQuota: json["jobs_quota"] == null ? null : json["jobs_quota"],
        availedJobsQuota: json["availed_jobs_quota"] == null ? null : json["availed_jobs_quota"],
        isSubscribed: json["is_subscribed"] == null ? null : json["is_subscribed"],
        personalFirstName: json["personal_first_name"] == null ? null : json["personal_first_name"],
        personalLastName: json["personal_last_name"] == null ? null : json["personal_last_name"],
        personalContactNumber: json["personal_contact_number"] == null ? null : json["personal_contact_number"],
        companyEmail: json["company_email"] == null ? null : json["company_email"],
        emailVerifiedAt: json["email_verified_at"],
        availFreepackage: json["avail_freepackage"] == null ? null : json["avail_freepackage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "ceo": ceo,
        "industry_id": industryId == null ? null : industryId,
        "ownership_type_id": ownershipTypeId == null ? null : ownershipTypeId,
        "description": description == null ? null : description,
        "location": location == null ? null : location,
        "no_of_offices": noOfOffices == null ? null : noOfOffices,
        "website": website,
        "no_of_employees": noOfEmployees,
        "established_in": establishedIn == null ? null : establishedIn,
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
        "verification_token": verificationToken == null ? null : verificationToken,
        "map": map,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "facebook": facebook,
        "twitter": twitter,
        "linkedin": linkedin,
        "google_plus": googlePlus,
        "pinterest": pinterest,
        "package_id": packageId == null ? null : packageId,
        "package_start_date": packageStartDate,
        "package_end_date": packageEndDate,
        "jobs_quota": jobsQuota == null ? null : jobsQuota,
        "availed_jobs_quota": availedJobsQuota == null ? null : availedJobsQuota,
        "is_subscribed": isSubscribed == null ? null : isSubscribed,
        "personal_first_name": personalFirstName == null ? null : personalFirstName,
        "personal_last_name": personalLastName == null ? null : personalLastName,
        "personal_contact_number": personalContactNumber == null ? null : personalContactNumber,
        "company_email": companyEmail == null ? null : companyEmail,
        "email_verified_at": emailVerifiedAt,
        "avail_freepackage": availFreepackage == null ? null : availFreepackage,
    };
}

class Id {
    Id({
        this.id,
        this.countryId,
        this.country,
        this.nationality,
        this.isDefault,
        this.isActive,
        this.sortOrder,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.stateId,
        this.state,
    });

    int? id;
    int? countryId;
    String? country;
    String? nationality;
    int? isDefault;
    int? isActive;
    int? sortOrder;
    String? lang;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? stateId;
    String? state;

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["id"] == null ? null : json["id"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        country: json["country"] == null ? null : json["country"],
        nationality: json["nationality"] == null ? null : json["nationality"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        sortOrder: json["sort_order"] == null ? null : json["sort_order"],
        lang: json["lang"] == null ? null : json["lang"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        stateId: json["state_id"] == null ? null : json["state_id"],
        state: json["state"] == null ? null : json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country_id": countryId == null ? null : countryId,
        "country": country == null ? null : country,
        "nationality": nationality == null ? null : nationality,
        "is_default": isDefault == null ? null : isDefault,
        "is_active": isActive == null ? null : isActive,
        "sort_order": sortOrder == null ? null : sortOrder,
        "lang": lang == null ? null : lang,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "state_id": stateId == null ? null : stateId,
        "state": state == null ? null : state,
    };
}

class JobSkill {
    JobSkill({
        this.id,
        this.jobId,
        this.jobSkillId,
        this.createdAt,
        this.updatedAt,
        this.jobSkill,
    });

    int? id;
    int? jobId;
    int? jobSkillId;
    DateTime? createdAt;
    DateTime? updatedAt;
    CareerLevelId? jobSkill;

    factory JobSkill.fromJson(Map<String, dynamic> json) => JobSkill(
        id: json["id"] == null ? null : json["id"],
        jobId: json["job_id"] == null ? null : json["job_id"],
        jobSkillId: json["job_skill_id"] == null ? null : json["job_skill_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        jobSkill: json["job_skill"] == null ? null : CareerLevelId.fromJson(json["job_skill"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "job_id": jobId == null ? null : jobId,
        "job_skill_id": jobSkillId == null ? null : jobSkillId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "job_skill": jobSkill == null ? null : jobSkill!.toJson(),
    };
}

class PackageLeft {
    PackageLeft({
        this.id,
        this.packageTitle,
        this.packagePrice,
        this.packageNumDays,
        this.packageNumListings,
        this.packageFor,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? packageTitle;
    int? packagePrice;
    int? packageNumDays;
    int? packageNumListings;
    String? packageFor;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory PackageLeft.fromJson(Map<String, dynamic> json) => PackageLeft(
        id: json["id"] == null ? null : json["id"],
        packageTitle: json["package_title"] == null ? null : json["package_title"],
        packagePrice: json["package_price"] == null ? null : json["package_price"],
        packageNumDays: json["package_num_days"] == null ? null : json["package_num_days"],
        packageNumListings: json["package_num_listings"] == null ? null : json["package_num_listings"],
        packageFor: json["package_for"] == null ? null : json["package_for"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "package_title": packageTitle == null ? null : packageTitle,
        "package_price": packagePrice == null ? null : packagePrice,
        "package_num_days": packageNumDays == null ? null : packageNumDays,
        "package_num_listings": packageNumListings == null ? null : packageNumListings,
        "package_for": packageFor == null ? null : packageFor,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
