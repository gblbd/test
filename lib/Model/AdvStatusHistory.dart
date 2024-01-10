import 'CreatedBy.dart';

class AdvStatusHistory {
  AdvStatusHistory({
    this.advStatus,
    this.createdBy,
    this.createdAt,
  });

  String? advStatus;
  CreatedBy? createdBy;
  int? createdAt;

  factory AdvStatusHistory.fromJson(Map<String, dynamic> json) => AdvStatusHistory(
    advStatus: json["advStatus"],
    createdBy: json["createdBy"] == null ? null : CreatedBy.fromJson(json["createdBy"]),
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "advStatus": advStatus,
    "createdBy": createdBy == null ? null : createdBy?.toJson(),
    "createdAt": createdAt,
  };
}