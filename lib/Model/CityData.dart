import 'Division.dart';

class Datum {
  Datum({
    this.id,
    this.districtName,
    this.division,
  });

  String? id;
  String? districtName;
  Division? division;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    districtName: json["districtName"],
    division: Division.fromJson(json["division"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "districtName": districtName,
    "division": division?.toJson(),
  };
}
