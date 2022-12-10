// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.notifications,
  });

  bool? status;
  List<Notification>? notifications;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"] == null ? null : json["status"],
    notifications: json["notifications"] == null ? null : List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "notifications": notifications == null ? null : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    this.id,
    this.companyId,
    this.seekerId,
    this.message,
    this.status,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.user
  });

  int? id;
  int? companyId;
  int? seekerId;
  String? message;
  String? status;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;


  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"] == null ? null : json["id"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    seekerId: json["seeker_id"] == null ? null : json["seeker_id"],
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    type: json["type"] == null ? null : json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "company_id": companyId == null ? null : companyId,
    "seeker_id": seekerId == null ? null : seekerId,
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "type": type == null ? null : type,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
  });

  int? id;
  String? name;
  String? email;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],

    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,

  };
}




