class District {
  District({
    this.districtName,
  });

  String? districtName;

  factory District.fromJson(Map<String, dynamic> json) => District(
    districtName: json["districtName"],
  );

  Map<String, dynamic> toJson() => {
    "districtName": districtName,
  };
}