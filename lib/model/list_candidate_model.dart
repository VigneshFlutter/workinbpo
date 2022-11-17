// To parse this JSON data, do
//
//     final listCandidateModel = listCandidateModelFromJson(jsonString);

import 'dart:convert';

ListCandidateModel listCandidateModelFromJson(String str) => ListCandidateModel.fromJson(json.decode(str));

String listCandidateModelToJson(ListCandidateModel data) => json.encode(data.toJson());

class ListCandidateModel {
  ListCandidateModel({
    this.status,
    this.jobApplications,
  });

  bool? status;
  List<JobApplication>? jobApplications;

  factory ListCandidateModel.fromJson(Map<String, dynamic> json) => ListCandidateModel(
    status: json["status"] == null ? null : json["status"],
    jobApplications: json["job_applications"] == null ? null : List<JobApplication>.from(json["job_applications"].map((x) => JobApplication.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
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
