
import 'dart:convert';

import 'CityData.dart';

AllCity AllCityFromJson(String str) => AllCity.fromJson(json.decode(str));

String AllCityToJson(AllCity data) => json.encode(data.toJson());

class AllCity{

  AllCity({
    this.data,
    this.message,
    this.statusCode,
    this.status,
    this.timestamp,
  });

  List<Datum>? data;
  String? message;
  int? statusCode;
  bool? status;
  double? timestamp;

  factory AllCity.fromJson(Map<String, dynamic> json) => AllCity(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
    status: json["status"],
    timestamp: json["timestamp"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "statusCode": statusCode,
    "status": status,
    "timestamp": timestamp,
  };

}