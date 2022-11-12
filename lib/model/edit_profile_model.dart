// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    this.status,
    this.data,
  });

  bool? status;
  String? data;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data,
  };
}
