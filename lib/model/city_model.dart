// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    CityModel({
        this.status,
        this.cities,
    });

    bool? status;
    List<City>? cities;

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
    };
}

class City {
    City({
        this.city,
        this.cityId,
    });

    String? city;
    int? cityId;

    factory City.fromJson(Map<String, dynamic> json) => City(
        city: json["city"],
        cityId: json["city_id"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "city_id": cityId,
    };
}
