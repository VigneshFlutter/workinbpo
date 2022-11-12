// To parse this JSON data, do
//
//     final masterModel = masterModelFromJson(jsonString);

import 'dart:convert';

MasterModel masterModelFromJson(String str) => MasterModel.fromJson(json.decode(str));

String masterModelToJson(MasterModel data) => json.encode(data.toJson());

class MasterModel {
  MasterModel({
    this.status,
    this.genders,
    this.maritalStatuses,
    this.nationalities,
    this.countries,
    this.jobExperiences,
    this.careerLevels,
    this.industries,
    this.functionalAreas,
    this.jobSkills,
    this.resulttype,
    this.langlevel,
    this.degreelevel,
    this.degreetype,
    this.language,
    this.activeLanguage,
    this.jobShifts,
    this.jobtypes,
    this.salaryperiods,
    this.currencyCodes,
    this.ownertype,
  });

  bool? status;
  List<Gender>? genders;
  List<MaritalStatus>? maritalStatuses;
  List<Nationality>? nationalities;
  List<Country>? countries;
  List<JobExperience>? jobExperiences;
  List<CareerLevel>? careerLevels;
  List<Industry>? industries;
  List<FunctionalArea>? functionalAreas;
  List<JobSkill>? jobSkills;
  List<Resulttype>? resulttype;
  List<Langlevel>? langlevel;
  List<Degreelevel>? degreelevel;
  List<Degreetype>? degreetype;
  List<Language>? language;
  List<ActiveLanguage>? activeLanguage;
  List<JobShift>? jobShifts;
  List<JobShift>? jobtypes;
  List<JobShift>? salaryperiods;
  List<CurrencyCode>? currencyCodes;
  List<Ownertype>? ownertype;

  factory MasterModel.fromJson(Map<String, dynamic> json) => MasterModel(
    status: json["status"] == null ? null : json["status"],
    genders: json["genders"] == null ? null : List<Gender>.from(json["genders"].map((x) => Gender.fromJson(x))),
    maritalStatuses: json["maritalStatuses"] == null ? null : List<MaritalStatus>.from(json["maritalStatuses"].map((x) => MaritalStatus.fromJson(x))),
    nationalities: json["nationalities"] == null ? null : List<Nationality>.from(json["nationalities"].map((x) => Nationality.fromJson(x))),
    countries: json["countries"] == null ? null : List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    jobExperiences: json["jobExperiences"] == null ? null : List<JobExperience>.from(json["jobExperiences"].map((x) => JobExperience.fromJson(x))),
    careerLevels: json["careerLevels"] == null ? null : List<CareerLevel>.from(json["careerLevels"].map((x) => CareerLevel.fromJson(x))),
    industries: json["industries"] == null ? null : List<Industry>.from(json["industries"].map((x) => Industry.fromJson(x))),
    functionalAreas: json["functionalAreas"] == null ? null : List<FunctionalArea>.from(json["functionalAreas"].map((x) => FunctionalArea.fromJson(x))),
    jobSkills: json["jobSkills"] == null ? null : List<JobSkill>.from(json["jobSkills"].map((x) => JobSkill.fromJson(x))),
    resulttype: json["resulttype"] == null ? null : List<Resulttype>.from(json["resulttype"].map((x) => Resulttype.fromJson(x))),
    langlevel: json["langlevel"] == null ? null : List<Langlevel>.from(json["langlevel"].map((x) => Langlevel.fromJson(x))),
    degreelevel: json["degreelevel"] == null ? null : List<Degreelevel>.from(json["degreelevel"].map((x) => Degreelevel.fromJson(x))),
    degreetype: json["degreetype"] == null ? null : List<Degreetype>.from(json["degreetype"].map((x) => Degreetype.fromJson(x))),
    language: json["Language"] == null ? null : List<Language>.from(json["Language"].map((x) => Language.fromJson(x))),
    activeLanguage: json["ActiveLanguage"] == null ? null : List<ActiveLanguage>.from(json["ActiveLanguage"].map((x) => ActiveLanguage.fromJson(x))),
    jobShifts: json["jobShifts"] == null ? null : List<JobShift>.from(json["jobShifts"].map((x) => JobShift.fromJson(x))),
    jobtypes: json["jobtypes"] == null ? null : List<JobShift>.from(json["jobtypes"].map((x) => JobShift.fromJson(x))),
    salaryperiods: json["salaryperiods"] == null ? null : List<JobShift>.from(json["salaryperiods"].map((x) => JobShift.fromJson(x))),
    currencyCodes: json["currency_codes"] == null ? null : List<CurrencyCode>.from(json["currency_codes"].map((x) => CurrencyCode.fromJson(x))),
    ownertype: json["ownertype"] == null ? null : List<Ownertype>.from(json["ownertype"].map((x) => Ownertype.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "genders": genders == null ? null : List<dynamic>.from(genders!.map((x) => x.toJson())),
    "maritalStatuses": maritalStatuses == null ? null : List<dynamic>.from(maritalStatuses!.map((x) => x.toJson())),
    "nationalities": nationalities == null ? null : List<dynamic>.from(nationalities!.map((x) => x.toJson())),
    "countries": countries == null ? null : List<dynamic>.from(countries!.map((x) => x.toJson())),
    "jobExperiences": jobExperiences == null ? null : List<dynamic>.from(jobExperiences!.map((x) => x.toJson())),
    "careerLevels": careerLevels == null ? null : List<dynamic>.from(careerLevels!.map((x) => x.toJson())),
    "industries": industries == null ? null : List<dynamic>.from(industries!.map((x) => x.toJson())),
    "functionalAreas": functionalAreas == null ? null : List<dynamic>.from(functionalAreas!.map((x) => x.toJson())),
    "jobSkills": jobSkills == null ? null : List<dynamic>.from(jobSkills!.map((x) => x.toJson())),
    "resulttype": resulttype == null ? null : List<dynamic>.from(resulttype!.map((x) => x.toJson())),
    "langlevel": langlevel == null ? null : List<dynamic>.from(langlevel!.map((x) => x.toJson())),
    "degreelevel": degreelevel == null ? null : List<dynamic>.from(degreelevel!.map((x) => x.toJson())),
    "degreetype": degreetype == null ? null : List<dynamic>.from(degreetype!.map((x) => x.toJson())),
    "Language": language == null ? null : List<dynamic>.from(language!.map((x) => x.toJson())),
    "ActiveLanguage": activeLanguage == null ? null : List<dynamic>.from(activeLanguage!.map((x) => x.toJson())),
    "jobShifts": jobShifts == null ? null : List<dynamic>.from(jobShifts!.map((x) => x.toJson())),
    "jobtypes": jobtypes == null ? null : List<dynamic>.from(jobtypes!.map((x) => x.toJson())),
    "salaryperiods": salaryperiods == null ? null : List<dynamic>.from(salaryperiods!.map((x) => x.toJson())),
    "currency_codes": currencyCodes == null ? null : List<dynamic>.from(currencyCodes!.map((x) => x.toJson())),
    "ownertype": ownertype == null ? null : List<dynamic>.from(ownertype!.map((x) => x.toJson())),
  };
}

class Ownertype {
  Ownertype({
    this.id,
    this.lang,
    this.ownershipType,
    this.isDefault,
    this.ownershipTypeId,
    this.isActive,
  });

  int? id;
  Lang? lang;
  String? ownershipType;
  int? isDefault;
  int? ownershipTypeId;
  int? isActive;

  factory Ownertype.fromJson(Map<String, dynamic> json) => Ownertype(
    id: json["id"] == null ? null : json["id"],
    lang: json["lang"] == null ? null : langValues.map[json["lang"]],
    ownershipType: json["ownership_type"] == null ? null : json["ownership_type"],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    ownershipTypeId: json["ownership_type_id"] == null ? null : json["ownership_type_id"],
    isActive: json["is_active"] == null ? null : json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "lang": lang == null ? null : langValues.reverse[lang],
    "ownership_type": ownershipType == null ? null : ownershipType,
    "is_default": isDefault == null ? null : isDefault,
    "ownership_type_id": ownershipTypeId == null ? null : ownershipTypeId,
    "is_active": isActive == null ? null : isActive,
  };
}

class ActiveLanguage {
  ActiveLanguage({
    this.native,
    this.isoCode,
  });

  String? native;
  String? isoCode;

  factory ActiveLanguage.fromJson(Map<String, dynamic> json) => ActiveLanguage(
    native: json["native"] == null ? null : json["native"],
    isoCode: json["iso_code"] == null ? null : json["iso_code"],
  );

  Map<String, dynamic> toJson() => {
    "native": native == null ? null : native,
    "iso_code": isoCode == null ? null : isoCode,
  };
}

class CareerLevel {
  CareerLevel({
    this.careerLevel,
    this.careerLevelId,
  });

  String? careerLevel;
  int? careerLevelId;

  factory CareerLevel.fromJson(Map<String, dynamic> json) => CareerLevel(
    careerLevel: json["career_level"] == null ? null : json["career_level"],
    careerLevelId: json["career_level_id"] == null ? null : json["career_level_id"],
  );

  Map<String, dynamic> toJson() => {
    "career_level": careerLevel == null ? null : careerLevel,
    "career_level_id": careerLevelId == null ? null : careerLevelId,
  };
}

class Country {
  Country({
    this.country,
    this.countryId,
  });

  String? country;
  int? countryId;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    country: json["country"] == null ? null : json["country"],
    countryId: json["country_id"] == null ? null : json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "country": country == null ? null : country,
    "country_id": countryId == null ? null : countryId,
  };
}

class CurrencyCode {
  CurrencyCode({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CurrencyCode.fromJson(Map<String, dynamic> json) => CurrencyCode(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class Degreelevel {
  Degreelevel({
    this.degreeLevel,
    this.degreeLevelId,
  });

  String? degreeLevel;
  int? degreeLevelId;

  factory Degreelevel.fromJson(Map<String, dynamic> json) => Degreelevel(
    degreeLevel: json["degree_level"] == null ? null : json["degree_level"],
    degreeLevelId: json["degree_level_id"] == null ? null : json["degree_level_id"],
  );

  Map<String, dynamic> toJson() => {
    "degree_level": degreeLevel == null ? null : degreeLevel,
    "degree_level_id": degreeLevelId == null ? null : degreeLevelId,
  };
}

class Degreetype {
  Degreetype({
    this.degreeType,
    this.degreeTypeId,
  });

  String? degreeType;
  int? degreeTypeId;

  factory Degreetype.fromJson(Map<String, dynamic> json) => Degreetype(
    degreeType: json["degree_type"] == null ? null : json["degree_type"],
    degreeTypeId: json["degree_type_id"] == null ? null : json["degree_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "degree_type": degreeType == null ? null : degreeType,
    "degree_type_id": degreeTypeId == null ? null : degreeTypeId,
  };
}

class FunctionalArea {
  FunctionalArea({
    this.functionalArea,
    this.functionalAreaId,
  });

  String? functionalArea;
  int? functionalAreaId;

  factory FunctionalArea.fromJson(Map<String, dynamic> json) => FunctionalArea(
    functionalArea: json["functional_area"] == null ? null : json["functional_area"],
    functionalAreaId: json["functional_area_id"] == null ? null : json["functional_area_id"],
  );

  Map<String, dynamic> toJson() => {
    "functional_area": functionalArea == null ? null : functionalArea,
    "functional_area_id": functionalAreaId == null ? null : functionalAreaId,
  };
}

class Gender {
  Gender({
    this.gender,
    this.genderId,
  });

  String? gender;
  int? genderId;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    gender: json["gender"] == null ? null : json["gender"],
    genderId: json["gender_id"] == null ? null : json["gender_id"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender == null ? null : gender,
    "gender_id": genderId == null ? null : genderId,
  };
}

class Industry {
  Industry({
    this.industry,
    this.industryId,
  });

  String? industry;
  int? industryId;

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    industry: json["industry"] == null ? null : json["industry"],
    industryId: json["industry_id"] == null ? null : json["industry_id"],
  );

  Map<String, dynamic> toJson() => {
    "industry": industry == null ? null : industry,
    "industry_id": industryId == null ? null : industryId,
  };
}

class JobExperience {
  JobExperience({
    this.jobExperience,
    this.jobExperienceId,
  });

  String? jobExperience;
  int? jobExperienceId;

  factory JobExperience.fromJson(Map<String, dynamic> json) => JobExperience(
    jobExperience: json["job_experience"] == null ? null : json["job_experience"],
    jobExperienceId: json["job_experience_id"] == null ? null : json["job_experience_id"],
  );

  Map<String, dynamic> toJson() => {
    "job_experience": jobExperience == null ? null : jobExperience,
    "job_experience_id": jobExperienceId == null ? null : jobExperienceId,
  };
}

class JobShift {
  JobShift({
    this.id,
    this.jobShift,
    this.isActive,
    this.lang,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.jobType,
    this.salaryPeriod,
  });

  int? id;
  String? jobShift;
  int? isActive;
  Lang? lang;
  int? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? jobType;
  String? salaryPeriod;

  factory JobShift.fromJson(Map<String, dynamic> json) => JobShift(
    id: json["id"] == null ? null : json["id"],
    jobShift: json["job_shift"] == null ? null : json["job_shift"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    lang: json["lang"] == null ? null : langValues.map[json["lang"]],
    isDefault: json["is_default"] == null ? null : json["is_default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    jobType: json["job_type"] == null ? null : json["job_type"],
    salaryPeriod: json["salary_period"] == null ? null : json["salary_period"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "job_shift": jobShift == null ? null : jobShift,
    "is_active": isActive == null ? null : isActive,
    "lang": lang == null ? null : langValues.reverse[lang],
    "is_default": isDefault == null ? null : isDefault,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "job_type": jobType == null ? null : jobType,
    "salary_period": salaryPeriod == null ? null : salaryPeriod,
  };
}

enum Lang { EN }

final langValues = EnumValues({
  "en": Lang.EN
});

class JobSkill {
  JobSkill({
    this.jobSkill,
    this.jobSkillId,
  });

  String? jobSkill;
  int? jobSkillId;

  factory JobSkill.fromJson(Map<String, dynamic> json) => JobSkill(
    jobSkill: json["job_skill"] == null ? null : json["job_skill"],
    jobSkillId: json["job_skill_id"] == null ? null : json["job_skill_id"],
  );

  Map<String, dynamic> toJson() => {
    "job_skill": jobSkill == null ? null : jobSkill,
    "job_skill_id": jobSkillId == null ? null : jobSkillId,
  };
}

class Langlevel {
  Langlevel({
    this.languageLevel,
    this.languageLevelId,
  });

  String? languageLevel;
  int? languageLevelId;

  factory Langlevel.fromJson(Map<String, dynamic> json) => Langlevel(
    languageLevel: json["language_level"] == null ? null : json["language_level"],
    languageLevelId: json["language_level_id"] == null ? null : json["language_level_id"],
  );

  Map<String, dynamic> toJson() => {
    "language_level": languageLevel == null ? null : languageLevel,
    "language_level_id": languageLevelId == null ? null : languageLevelId,
  };
}

class Language {
  Language({
    this.lang,
    this.id,
  });

  String? lang;
  int? id;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    lang: json["lang"] == null ? null : json["lang"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang == null ? null : lang,
    "id": id == null ? null : id,
  };
}

class MaritalStatus {
  MaritalStatus({
    this.maritalStatus,
    this.maritalStatusId,
  });

  String? maritalStatus;
  int? maritalStatusId;

  factory MaritalStatus.fromJson(Map<String, dynamic> json) => MaritalStatus(
    maritalStatus: json["marital_status"] == null ? null : json["marital_status"],
    maritalStatusId: json["marital_status_id"] == null ? null : json["marital_status_id"],
  );

  Map<String, dynamic> toJson() => {
    "marital_status": maritalStatus == null ? null : maritalStatus,
    "marital_status_id": maritalStatusId == null ? null : maritalStatusId,
  };
}

class Nationality {
  Nationality({
    this.nationality,
    this.countryId,
  });

  String? nationality;
  int? countryId;

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    nationality: json["nationality"] == null ? null : json["nationality"],
    countryId: json["country_id"] == null ? null : json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "nationality": nationality == null ? null : nationality,
    "country_id": countryId == null ? null : countryId,
  };
}

class Resulttype {
  Resulttype({
    this.resultType,
    this.resultTypeId,
  });

  String? resultType;
  int? resultTypeId;

  factory Resulttype.fromJson(Map<String, dynamic> json) => Resulttype(
    resultType: json["result_type"] == null ? null : json["result_type"],
    resultTypeId: json["result_type_id"] == null ? null : json["result_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "result_type": resultType == null ? null : resultType,
    "result_type_id": resultTypeId == null ? null : resultTypeId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
