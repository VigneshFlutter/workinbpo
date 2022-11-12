// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
    DistrictModel({
        this.status,
        this.states,
    });

    bool? status;
    List<District>? states;

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        status: json["status"],
        states: List<District>.from(json["states"].map((x) => District.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "states": List<dynamic>.from(states!.map((x) => x.toJson())),
    };
}

class District {
    District({
        this.state,
        this.stateId,
    });

    String? state;
    int? stateId;

    factory District.fromJson(Map<String, dynamic> json) => District(
        state: json["state"],
        stateId: json["state_id"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "state_id": stateId,
    };
}
