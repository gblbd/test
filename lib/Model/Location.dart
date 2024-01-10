class Location {
  Location({
    this.addressText,
    this.longitude,
    this.latitude,
  });

  String? addressText;
  double? longitude;
  double? latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    addressText: json["addressText"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "addressText": addressText,
    "longitude": longitude,
    "latitude": latitude,
  };
}