class Division {
  Division({
    this.id,
    this.divisionName,
  });

  String? id;
  String? divisionName;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    id: json["id"],
    divisionName: json["divisionName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "divisionName": divisionName,
  };
}