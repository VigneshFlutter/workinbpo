// To parse this JSON data, do
//
//     final plansAndPackagesModel = plansAndPackagesModelFromJson(jsonString);

import 'dart:convert';

PlansAndPackagesModel plansAndPackagesModelFromJson(String str) => PlansAndPackagesModel.fromJson(json.decode(str));

String plansAndPackagesModelToJson(PlansAndPackagesModel data) => json.encode(data.toJson());

class PlansAndPackagesModel {
    PlansAndPackagesModel({
        this.status,
        this.company,
        this.packages,
    });

    bool? status;
    Company? company;
    List<Package>? packages;

    factory PlansAndPackagesModel.fromJson(Map<String, dynamic> json) => PlansAndPackagesModel(
        status: json["status"] == null ? null : json["status"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        packages: json["packages"] == null ? null : List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "company": company == null ? null : company!.toJson(),
        "packages": packages == null ? null : List<dynamic>.from(packages!.map((x) => x.toJson())),
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
        this.package,
    });

    int? id;
    String? name;
    String? email;
    dynamic ceo;
    dynamic industryId;
    dynamic ownershipTypeId;
    dynamic description;
    String? location;
    int? noOfOffices;
    String? website;
    dynamic noOfEmployees;
    String? establishedIn;
    dynamic fax;
    String? phone;
    String? logo;
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
    DateTime? packageStartDate;
    DateTime? packageEndDate;
    int? jobsQuota;
    int? availedJobsQuota;
    int? isSubscribed;
    String? personalFirstName;
    String? personalLastName;
    String? personalContactNumber;
    String? companyEmail;
    dynamic emailVerifiedAt;
    int? availFreepackage;
    Package? package;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        ceo: json["ceo"],
        industryId: json["industry_id"],
        ownershipTypeId: json["ownership_type_id"],
        description: json["description"],
        location: json["location"] == null ? null : json["location"],
        noOfOffices: json["no_of_offices"] == null ? null : json["no_of_offices"],
        website: json["website"] == null ? null : json["website"],
        noOfEmployees: json["no_of_employees"],
        establishedIn: json["established_in"] == null ? null : json["established_in"],
        fax: json["fax"],
        phone: json["phone"] == null ? null : json["phone"],
        logo: json["logo"] == null ? null : json["logo"],
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
        packageStartDate: json["package_start_date"] == null ? null : DateTime.parse(json["package_start_date"]),
        packageEndDate: json["package_end_date"] == null ? null : DateTime.parse(json["package_end_date"]),
        jobsQuota: json["jobs_quota"] == null ? null : json["jobs_quota"],
        availedJobsQuota: json["availed_jobs_quota"] == null ? null : json["availed_jobs_quota"],
        isSubscribed: json["is_subscribed"] == null ? null : json["is_subscribed"],
        personalFirstName: json["personal_first_name"] == null ? null : json["personal_first_name"],
        personalLastName: json["personal_last_name"] == null ? null : json["personal_last_name"],
        personalContactNumber: json["personal_contact_number"] == null ? null : json["personal_contact_number"],
        companyEmail: json["company_email"] == null ? null : json["company_email"],
        emailVerifiedAt: json["email_verified_at"],
        availFreepackage: json["avail_freepackage"] == null ? null : json["avail_freepackage"],
        package: json["package"] == null ? null : Package.fromJson(json["package"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "ceo": ceo,
        "industry_id": industryId,
        "ownership_type_id": ownershipTypeId,
        "description": description,
        "location": location == null ? null : location,
        "no_of_offices": noOfOffices == null ? null : noOfOffices,
        "website": website == null ? null : website,
        "no_of_employees": noOfEmployees,
        "established_in": establishedIn == null ? null : establishedIn,
        "fax": fax,
        "phone": phone == null ? null : phone,
        "logo": logo == null ? null : logo,
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
        "package_start_date": packageStartDate == null ? null : packageStartDate!.toIso8601String(),
        "package_end_date": packageEndDate == null ? null : packageEndDate!.toIso8601String(),
        "jobs_quota": jobsQuota == null ? null : jobsQuota,
        "availed_jobs_quota": availedJobsQuota == null ? null : availedJobsQuota,
        "is_subscribed": isSubscribed == null ? null : isSubscribed,
        "personal_first_name": personalFirstName == null ? null : personalFirstName,
        "personal_last_name": personalLastName == null ? null : personalLastName,
        "personal_contact_number": personalContactNumber == null ? null : personalContactNumber,
        "company_email": companyEmail == null ? null : companyEmail,
        "email_verified_at": emailVerifiedAt,
        "avail_freepackage": availFreepackage == null ? null : availFreepackage,
        "package": package == null ? null : package!.toJson(),
    };
}

class Package {
    Package({
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

    factory Package.fromJson(Map<String, dynamic> json) => Package(
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
