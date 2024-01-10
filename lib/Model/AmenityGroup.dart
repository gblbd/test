class AmenityGroup {
  AmenityGroup({
    this.title,
    this.amenities,
    this.active,
  });

  String? title;
  List<dynamic>? amenities;
  bool? active;

  factory AmenityGroup.fromJson(Map<String, dynamic> json) => AmenityGroup(
    title: json["title"],
    amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "amenities": List<dynamic>.from(amenities!.map((x) => x)),
    "active": active,
  };
}