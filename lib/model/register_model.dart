// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status,
    this.token,
    this.data,
  });

  bool? status;
  String? token;
  String? data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"] == null ? null : json["status"],
    token: json["token"] == null ? null : json["token"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "token": token == null ? null : token,
    "data": data == null ? null : data,
  };
}
