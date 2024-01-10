
import 'District.dart';
import 'Division.dart';
import 'PoliceStation.dart';

class Address {
  Address({
    this.division,
    this.district,
    this.policeStation,
    this.streetAddress,
    this.city,
    this.area,
    this.zipCode,
    this.country,
  });

  Division? division;
  District? district;
  PoliceStation? policeStation;
  String? streetAddress;
  String? city;
  String? area;
  int? zipCode;
  String? country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    division: Division.fromJson(json["division"]),
    district: District.fromJson(json["district"]),
    policeStation: PoliceStation.fromJson(json["policeStation"]),
    streetAddress: json["streetAddress"],
    city: json["city"],
    area: json["area"],
    zipCode: json["zipCode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "division": division?.toJson(),
    "district": district?.toJson(),
    "policeStation": policeStation?.toJson(),
    "streetAddress": streetAddress,
    "city": city,
    "area": area,
    "zipCode": zipCode,
    "country": country,
  };
}