// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.company,
    this.ownershipTypes,
  });

  bool? status;
  Company? company;
  OwnershipTypes? ownershipTypes;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"] == null ? null : json["status"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    ownershipTypes: json["ownershipTypes"] == null ? null : OwnershipTypes.fromJson(json["ownershipTypes"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "company": company == null ? null : company!.toJson(),
    "ownershipTypes": ownershipTypes == null ? null : ownershipTypes!.toJson(),
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
    this.ownershipType,
    this.industry,
  });

  int? id;
  String? name;
  String? email;
  String? ceo;
  Industry? industryId;
  Industry? ownershipTypeId;
  dynamic description;
  dynamic location;
  int? noOfOffices;
  String? website;
  dynamic noOfEmployees;
  String? establishedIn;
  dynamic fax;
  String? phone;
  dynamic logo;
  CountryId? countryId;
  Id? stateId;
  Id? cityId;
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
  dynamic packageStartDate;
  dynamic packageEndDate;
  int? jobsQuota;
  int? availedJobsQuota;
  int? isSubscribed;
  String? personalFirstName;
  String? personalLastName;
  int? personalContactNumber;
  String? companyEmail;
  dynamic emailVerifiedAt;
  int? availFreepackage;
  Industry? ownershipType;
  Industry? industry;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    ceo: json["ceo"] == null ? null : json["ceo"],
    industryId: json["industry_id"] == null ? null : Industry.fromJson(json["industry_id"]),
    ownershipTypeId: json["ownership_type_id"] == null ? null : Industry.fromJson(json["ownership_type_id"]),
    description: json["description"],
    location: json["location"],
    noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
    website: json["website"] == null ? null : json["website"],
    noOfEmployees: json["no_of_employees"],
    establishedIn: json["established_in"] == null ? null : json["established_in"],
    fax: json["fax"],
    phone: json["phone"] == null ? null : json["phone"],
    logo: json["logo"],
    countryId: json["country_id"] == null ? null : CountryId.fromJson(json["country_id"]),
    stateId: json["state_id"] == null ? null : Id.fromJson(json["state_id"]),
    cityId: json["city_id"] == null ? null : Id.fromJson(json["city_id"]),
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
    ownershipType: json["ownership_type"] == null ? null : Industry.fromJson(json["ownership_type"]),
    industry: json["industry"] == null ? null : Industry.fromJson(json["industry"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "ceo": ceo == null ? null : ceo,
    "industry_id": industryId == null ? null : industryId!.toJson(),
    "ownership_type_id": ownershipTypeId == null ? null : ownershipTypeId!.toJson(),
    "description": description,
    "location": location,
    "no_of_offices": noOfOffices == null ? null : noOfOffices,
    "website": website == null ? null : website,
    "no_of_employees": noOfEmployees,
    "established_in": establishedIn == null ? null : establishedIn,
    "fax": fax,
    "phone": phone == null ? null : phone,
    "logo": logo,
    "country_id": countryId == null ? null : countryId!.toJson(),
    "state_id": stateId == null ? null : stateId!.toJson(),
    "city_id": cityId == null ? null : cityId!.toJson(),
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
    "ownership_type": ownershipType == null ? null : ownershipType!.toJson(),
    "industry": industry == null ? null : industry!.toJson(),
  };
}

class Id {
  Id({
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
    this.state,
    this.countryId,
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
  String? state;
  int? countryId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
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
    state: json["state"] == null ? null : json["state"],
    countryId: json["country_id"] == null ? null : json["country_id"],
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
    "state": state == null ? null : state,
    "country_id": countryId == null ? null : countryId,
  };
}

class CountryId {
  CountryId({
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

  factory CountryId.fromJson(Map<String, dynamic> json) => CountryId(
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
  };
}

class Industry {
  Industry({
    this.id,
    this.industryId,
    this.industry,
    this.isActive,
    this.sortOrder,
    this.lang,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.ownershipTypeId,
    this.ownershipType,
  });

  int? id;
  int? industryId;
  String? industry;
  int? isActive;
  int? sortOrder;
  String? lang;
  int? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? ownershipTypeId;
  String? ownershipType;

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    id: json["id"] == null ? null : json["id"],
    industryId: json["industry_id"] == null ? null : json["industry_id"],
    industry: json["industry"] == null ? null : json["industry"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    lang: json["lang"] == null ? null : json["lang"],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    ownershipTypeId: json["ownership_type_id"] == null ? null : json["ownership_type_id"],
    ownershipType: json["ownership_type"] == null ? null : json["ownership_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "industry_id": industryId == null ? null : industryId,
    "industry": industry == null ? null : industry,
    "is_active": isActive == null ? null : isActive,
    "sort_order": sortOrder == null ? null : sortOrder,
    "lang": lang == null ? null : lang,
    "is_default": isDefault == null ? null : isDefault,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "ownership_type_id": ownershipTypeId == null ? null : ownershipTypeId,
    "ownership_type": ownershipType == null ? null : ownershipType,
  };
}

class OwnershipTypes {
  OwnershipTypes({
    this.the21,
  });

  String? the21;

  factory OwnershipTypes.fromJson(Map<String, dynamic> json) => OwnershipTypes(
    the21: json["21"] == null ? null : json["21"],
  );

  Map<String, dynamic> toJson() => {
    "21": the21 == null ? null : the21,
  };
}
