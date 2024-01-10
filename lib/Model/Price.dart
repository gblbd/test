class Price {
  Price({
    this.hourly,
    this.daily,
    this.weekend,
    this.weekly,
    this.monthly,
  });

  double? hourly;
  double? daily;
  double? weekend;
  double? weekly;
  double? monthly;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    hourly: json["hourly"].toDouble(),
    daily: json["daily"].toDouble(),
    weekend: json["weekend"].toDouble(),
    weekly: json["weekly"].toDouble(),
    monthly: json["monthly"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "hourly": hourly,
    "daily": daily,
    "weekend": weekend,
    "weekly": weekly,
    "monthly": monthly,
  };
}