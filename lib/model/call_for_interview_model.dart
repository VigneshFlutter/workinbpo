// To parse this JSON data, do
//
//     final callForInterviewModel = callForInterviewModelFromJson(jsonString);

import 'dart:convert';

CallForInterviewModel callForInterviewModelFromJson(String str) => CallForInterviewModel.fromJson(json.decode(str));

String callForInterviewModelToJson(CallForInterviewModel data) => json.encode(data.toJson());

class CallForInterviewModel {
  CallForInterviewModel({
    this.status,
    this.userId,
    this.jobId,
    this.companyId,
    this.email,
    this.name,
    this.subject,
    this.content,
  });

  bool? status;
  String? userId;
  String? jobId;
  String? companyId;
  String? email;
  String? name;
  String? subject;
  String? content;

  factory CallForInterviewModel.fromJson(Map<String, dynamic> json) => CallForInterviewModel(
    status: json["status"] == null ? null : json["status"],
    userId: json["user_id"] == null ? null : json["user_id"],
    jobId: json["job_id"] == null ? null : json["job_id"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    subject: json["subject"] == null ? null : json["subject"],
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "user_id": userId == null ? null : userId,
    "job_id": jobId == null ? null : jobId,
    "company_id": companyId == null ? null : companyId,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "subject": subject == null ? null : subject,
    "content": content == null ? null : content,
  };
}
