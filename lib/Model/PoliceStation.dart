class PoliceStation {
  PoliceStation({
    this.policeStationName,
  });

  String? policeStationName;

  factory PoliceStation.fromJson(Map<String, dynamic> json) => PoliceStation(
    policeStationName: json["policeStationName"],
  );

  Map<String, dynamic> toJson() => {
    "policeStationName": policeStationName,
  };
}