class ShiftingTime {
  ShiftingTime({
    this.shiftFrom,
    this.shiftTo,
  });

  String? shiftFrom;
  String? shiftTo;

  factory ShiftingTime.fromJson(Map<String, dynamic> json) => ShiftingTime(
    shiftFrom: json["shiftFrom"],
    shiftTo: json["shiftTo"],
  );

  Map<String, dynamic> toJson() => {
    "shiftFrom": shiftFrom,
    "shiftTo": shiftTo,
  };
}